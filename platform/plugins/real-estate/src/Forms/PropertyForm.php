<?php

namespace Botble\RealEstate\Forms;

use Botble\Base\Facades\Assets;
use Botble\Base\Forms\FieldOptions\AutocompleteFieldOption;
use Botble\Base\Forms\FieldOptions\ContentFieldOption;
use Botble\Base\Forms\FieldOptions\DescriptionFieldOption;
use Botble\Base\Forms\FieldOptions\HtmlFieldOption;
use Botble\Base\Forms\FieldOptions\MediaImagesFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\OnOffFieldOption;
use Botble\Base\Forms\FieldOptions\RepeaterFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\Fields\AutocompleteField;
use Botble\Base\Forms\Fields\EditorField;
use Botble\Base\Forms\Fields\HtmlField;
use Botble\Base\Forms\Fields\MediaImagesField;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\OnOffField;
use Botble\Base\Forms\Fields\RepeaterField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\Location\Fields\Options\SelectLocationFieldOption;
use Botble\Location\Fields\SelectLocationField;
use Botble\RealEstate\Enums\CustomFieldEnum;
use Botble\RealEstate\Enums\PropertyPeriodEnum;
use Botble\RealEstate\Enums\PropertyStatusEnum;
use Botble\RealEstate\Enums\PropertyTypeEnum;
use Botble\RealEstate\Facades\RealEstateHelper;
use Botble\RealEstate\Forms\Fields\CategoryMultiField;
use Botble\RealEstate\Forms\Fronts\Auth\FieldOptions\TextFieldOption;
use Botble\RealEstate\Http\Requests\PropertyRequest;
use Botble\RealEstate\Models\Currency;
use Botble\RealEstate\Models\CustomField;
use Botble\RealEstate\Models\Facility;
use Botble\RealEstate\Models\Feature;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;
use stdClass;

class PropertyForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::usingVueJS()
            ->addStyles('datetimepicker')
            ->addScripts('input-mask')
            ->addStylesDirectly('vendor/core/plugins/real-estate/css/real-estate.css')
            ->addScriptsDirectly([
                'vendor/core/plugins/real-estate/js/real-estate.js',
                'vendor/core/plugins/real-estate/js/components.js',
            ]);

        $projects = Project::query()
            ->select('name', 'id')
            ->latest()
            ->get()
            ->mapWithKeys(fn (Project $item) => [$item->getKey() => $item->name]) // @phpstan-ignore-line
            ->all();

        $currencies = Currency::query()->latest('is_default')->oldest('id')->pluck('title', 'id')->all();

        $selectedCategories = [];
        if ($this->getModel()) {
            /**
             * @var Property $property
             */
            $property = $this->getModel();

            $selectedCategories = $property->categories()->pluck('category_id')->all();
        }

        $selectedFeatures = [];
        if ($this->getModel()) {
            /**
             * @var Property $property
             */
            $property = $this->getModel();

            $selectedFeatures = $property->features()->pluck('id')->all();
        }

        $features = Feature::query()
            ->select('id', 'name')
            ->get()
            ->each(function ($item): void {
                $item->name = (string) $item->name;
            });

        $facilities = Facility::query()
            ->select('id', 'name')
            ->get()
            ->each(function ($item): void {
                $item->name = (string) $item->name;
            });

        if ($this->getModel()) {
            /**
             * @var Property $property
             */
            $property = $this->getModel();

            $selectedFacilities = $property->facilities()->select('re_facilities.id', 'distance')->get();
        } else {
            $selectedFacilities = collect();

            $oldSelectedFacilities = old('facilities', []);

            if (! empty($oldSelectedFacilities)) {
                foreach ($oldSelectedFacilities as $oldSelectedFacility) {
                    if (! isset($oldSelectedFacility['id']) || ! isset($oldSelectedFacility['distance'])) {
                        continue;
                    }

                    $item = new stdClass();
                    $item->id = $oldSelectedFacility['id'];
                    $item->distance = $oldSelectedFacility['distance'];

                    $selectedFacilities->add($item);
                }
            }
        }

        $squareUnit = setting('real_estate_square_unit', 'm²') ? sprintf('(%s)', setting('real_estate_square_unit', 'm²')) : null;

        // Category mapping based on property type
     $categoryMapping = [
    'sale' => ['Apartment', 'House', 'Villa', 'Independent Builder Floor', 'Plot', 'Land', 'Studio Apartment', 'Farmhouse', 'Condo'],
    'rent' => ['Apartment', 'House', 'Villa', 'Independent Builder Floor', 'Studio Apartment', 'Serviced Apartment', 'Farmhouse', 'Condo'],
    'pg'   => ['PG'],
];

if ($this->getModel() && is_in_admin(true)) {
    add_filter('base_action_form_actions_extra', function (?string $html) {
        return $html . view(
            'plugins/real-estate::partials.forms.duplicate-button',
            [
                'url' => route('property.duplicate-property', $this->getModel()->id),
                'label' => trans('plugins/real-estate::property.duplicate'),
            ]
        )->render();
    });
}

$this
    ->model(Property::class)
    ->setValidatorClass(PropertyRequest::class)
    ->template('plugins/real-estate::partials.forms.property-form-stepper')
// Step 1 Start

    ->add('name', TextField::class, [
    'label' => 'Property Name',
    'required' => true,
    'attr' => [
        'placeholder' => 'Enter property name',
    ],
])


->add('type', SelectField::class, [
    'label' => "I'm looking to",
    'required' => true,
    'choices' => PropertyTypeEnum::labels(),
    'attr' => [
        'class' => 'form-control js-property-type',
    ],
])

->add('categories_custom', HtmlField::class, [
'label' => false,
'html' => '

<h4 class="mb-3">What kind of property do you have?</h4>

<!-- Residential / Commercial -->
<div class="mb-3">
    <label class="me-4">
        <input type="radio" name="property_group" value="residential" checked>
        Residential
    </label>

    <label>
        <input type="radio" name="property_group" value="commercial">
        Commercial
    </label>
</div>

<div id="category-container" class="row"></div>

<style>
.property-pill {
    padding:8px 18px;
    border:1px solid #dcdcdc;
    border-radius:30px;
    cursor:pointer;
    margin:5px;
    display:inline-block;
}
.property-pill input {
    display:none;
}
.property-pill.active {
    background:#0d6efd;
    color:#fff;
    border-color:#0d6efd;
}
</style>

<script>
document.addEventListener("DOMContentLoaded", function(){

    const categoryMap = {
        sale: {
            residential: [
                "Flat/Apartment","Independent House / Villa",
                "Independent / Builder Floor","Plot / Land",
                "1 RK / Studio Apartment","Serviced Apartment",
                "Farmhouse","Other"
            ],
            commercial: [
                "Office","Retail","Plot / Land",
                "Storage","Industry","Hospitality","Other"
            ]
        },
        rent: {
            residential: [
                "Flat/Apartment","Independent House / Villa",
                "Independent / Builder Floor",
                "1 RK / Studio Apartment",
                "Serviced Apartment","Farmhouse","Other"
            ],
            commercial: [
                "Office","Retail","Storage",
                "Industry","Hospitality","Other"
            ]
        },
        pg: {
            residential: [
                "Flat/Apartment","Independent House / Villa",
                "Independent / Builder Floor",
                "1 RK / Studio Apartment",
                "Serviced Apartment"
            ],
            commercial: []
        }
    };

    const typeSelect = document.querySelector(".js-property-type");
    const container = document.getElementById("category-container");
    const residentialRadio = document.querySelector("input[value=residential]");
    const commercialRadio = document.querySelector("input[value=commercial]");

    function handlePGAndCommercialLogic() {

        const type = typeSelect.value;
        const selectedGroup = document.querySelector("input[name=property_group]:checked").value;

        // 1️⃣ If PG selected → disable commercial
        if(type === "pg"){
            commercialRadio.disabled = true;
            commercialRadio.parentElement.style.opacity = 0.5;

            // Force residential
            residentialRadio.checked = true;

        } else {
            commercialRadio.disabled = false;
            commercialRadio.parentElement.style.opacity = 1;
        }

        // 2️⃣ If Commercial selected → hide PG option
        const pgOption = typeSelect.querySelector("option[value=\'pg\']");
        if(selectedGroup === "commercial"){

            if(type === "pg"){
                typeSelect.value = "sale";
            }

            if(pgOption){
                pgOption.style.display = "none";
            }

        } else {
            if(pgOption){
                pgOption.style.display = "block";
            }
        }
    }

    function renderCategories() {

        const type = typeSelect.value;
        const group = document.querySelector("input[name=property_group]:checked").value;

        container.innerHTML = "";

        if(!categoryMap[type]) return;

        const categories = categoryMap[type][group] || [];

        categories.forEach(function(name){

            const col = document.createElement("div");
            col.className = "col-md-4";

            col.innerHTML = `
                <label class="property-pill">
                    <input type="checkbox" name="categories[]" value="${name}">
                    ${name}
                </label>
            `;

            container.appendChild(col);
        });

        handlePGAndCommercialLogic();
    }

    // Initial Load
    setTimeout(function(){
        renderCategories();
    }, 300);

    // Change Events
    document.addEventListener("change", function(e){

        if(e.target.classList.contains("js-property-type")){
            renderCategories();
        }

        if(e.target.name === "property_group"){
            renderCategories();
        }

    });

});
</script>

'
])


// Step 1 End

// Step 2 Start

  ->add(
    'location_heading',
    HtmlField::class,
    [
        'label' => false,
        'wrapper' => ['class' => 'form-group col-12'],
        'html' => '<h5 class="mb-3">Location Details</h5>',
    ]
)

->when(is_plugin_active('location'), function (FormAbstract $form): void {
    $form->add(
        'location_data',
        SelectLocationField::class,
        SelectLocationFieldOption::make()
    );
})

->add(
    'location', 
    TextField::class,
    TextFieldOption::make()
        ->label(trans('plugins/real-estate::property.form.location'))
        ->placeholder(trans('plugins/real-estate::property.form.location'))
        ->maxLength(191)
)

            
// Step 2 End

// Step 3 Start
->add('number_bedroom', HtmlField::class, [
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'html' => '

    <label class="form-label fw-bold">
        Number of Bedrooms
    </label>

    <div class="row mt-2">
        <div class="col-md-6 d-flex align-items-center justify-content-between">
            <span>Bedrooms</span>
            <div class="d-flex align-items-center">
                <button type="button" class="btn btn-light bedroom-minus">-</button>
                <input type="text" id="bedroom_count" value="1" readonly 
                       class="form-control text-center mx-2" 
                       style="width:60px;">
                <button type="button" class="btn btn-light bedroom-plus">+</button>
            </div>
        </div>
    </div>

    <input type="hidden" name="number_bedroom" id="number_bedroom_hidden" value="1">

    <script>
    document.addEventListener("DOMContentLoaded", function(){

        let input = document.getElementById("bedroom_count");
        let hidden = document.getElementById("number_bedroom_hidden");

        function updateHidden(){
            hidden.value = input.value;
        }

        document.querySelector(".bedroom-plus").addEventListener("click", function(){
            if(parseInt(input.value) < 10){   // limit max 10
                input.value = parseInt(input.value) + 1;
                updateHidden();
            }
        });

        document.querySelector(".bedroom-minus").addEventListener("click", function(){
            if(parseInt(input.value) > 1){
                input.value = parseInt(input.value) - 1;
                updateHidden();
            }
        });

        updateHidden();

    });
    </script>

    ',
])
->add('number_bathroom', HtmlField::class, [
    'wrapper' => ['class' => 'form-group mb-3 col-md-6'],
    'html' => '

    <label class="form-label fw-bold">
        Number of Bathrooms
    </label>

    <div class="col-md-6 d-flex align-items-center justify-content-between mt-2">
        <span>Bathrooms</span>
        <div class="d-flex align-items-center">
            <button type="button" class="btn btn-light bath-minus">-</button>
            <input type="text" id="bathroom_count" value="1" readonly 
                   class="form-control text-center mx-2" style="width:60px;">
            <button type="button" class="btn btn-light bath-plus">+</button>
        </div>
    </div>

    <input type="hidden" name="number_bathroom" id="number_bathroom_hidden" value="1">

    ',
])
->add('number_balcony', HtmlField::class, [
    'wrapper' => ['class' => 'form-group mb-3 col-md-6'],
    'html' => '

    <label class="form-label fw-bold">
        Number of Balconies
    </label>

    <div class="d-flex align-items-center justify-content-between mt-2">
        <span>Balconies</span>
        <div class="d-flex align-items-center">
            <button type="button" class="btn btn-light balcony-minus">-</button>
            <input type="text" id="balcony_count" value="0" readonly 
                   class="form-control text-center mx-2" style="width:60px;">
            <button type="button" class="btn btn-light balcony-plus">+</button>
        </div>
    </div>

    <input type="hidden" name="number_balcony" id="number_balcony_hidden" value="0">

    ',
])
->add('number_floor', HtmlField::class, [
    'wrapper' => ['class' => 'form-group mb-3 col-md-6'],
    'html' => '

    <label class="form-label fw-bold">
        Floor Number
    </label>

    <div class="col-md-6 d-flex align-items-center justify-content-between mt-2">
        <span>Floor</span>
        <div class="d-flex align-items-center">
            <button type="button" class="btn btn-light floor-minus">-</button>
            <input type="text" id="floor_count" value="1" readonly 
                   class="form-control text-center mx-2" style="width:60px;">
            <button type="button" class="btn btn-light floor-plus">+</button>
        </div>
    </div>

    <input type="hidden" name="number_floor" id="number_floor_hidden" value="1">

    ',
])
->add('counter_script', HtmlField::class, [
    'wrapper' => ['class' => 'd-none'],
    'html' => '

<script>
document.addEventListener("DOMContentLoaded", function(){

    function setupCounter(minusClass, plusClass, inputId, hiddenId, min, max) {

        let input = document.getElementById(inputId);
        let hidden = document.getElementById(hiddenId);

        if(!input || !hidden) return;

        function update() {
            hidden.value = input.value;
        }

        let plusBtn = document.querySelector("." + plusClass);
        let minusBtn = document.querySelector("." + minusClass);

        if(plusBtn){
            plusBtn.addEventListener("click", function(){
                if(parseInt(input.value) < max){
                    input.value = parseInt(input.value) + 1;
                    update();
                }
            });
        }

        if(minusBtn){
            minusBtn.addEventListener("click", function(){
                if(parseInt(input.value) > min){
                    input.value = parseInt(input.value) - 1;
                    update();
                }
            });
        }

        update();
    }

    setupCounter("bath-minus", "bath-plus", "bathroom_count", "number_bathroom_hidden", 1, 10);
    setupCounter("balcony-minus", "balcony-plus", "balcony_count", "number_balcony_hidden", 0, 10);
    setupCounter("floor-minus", "floor-plus", "floor_count", "number_floor_hidden", 1, 100);

});
</script>

    ',
])

->add('all_areas_combined', HtmlField::class, [
'label' => false,
'wrapper' => ['class' => 'form-group mb-4 col-12'],
'html' => '

<style>
.area-link {
    color:#0d6efd;
    cursor:pointer;
    font-weight:500;
    margin-right:20px;
}
.area-link:hover {
    text-decoration: underline;
}

/* FORCE HIDE */
#builtField,
#superField {
    display:none;
}
</style>

<h5 class="mb-1">Add Area Details</h5>
<p class="text-muted small">At least one area type is mandatory</p>

<div class="mb-3">
    <span class="area-link" id="showBuilt">+ Built-up Area</span>
    <span class="area-link" id="showSuper">+ Super Built-up Area</span>
</div>

<div class="row">

    <!-- Carpet Area (Always Visible) -->
    <div class="col-md-4 mb-3">
        <label class="form-label">Carpet Area</label>
        <div class="input-group">
            <input type="number"
                   name="carpet_area"
                   value="' . old('carpet_area', $this->getModel()->carpet_area) . '"
                   class="form-control"
                   placeholder="Enter area"
                   min="0"
                   step="any">
            <select name="carpet_area_unit" class="form-select">
                <option value="sq_ft">sq.ft.</option>
                <option value="sq_yd">sq.yards</option>
                <option value="sq_m">sq.m.</option>
                <option value="acres">acres</option>
            </select>
        </div>
    </div>

    <!-- Built-up Area (Hidden Initially) -->
    <div class="col-md-4 mb-3" id="builtField">
        <label class="form-label">Built-up Area</label>
        <div class="input-group">
            <input type="number"
                   name="built_up_area"
                   value="' . old('built_up_area', $this->getModel()->built_up_area) . '"
                   class="form-control"
                   placeholder="Enter area"
                   min="0"
                   step="any">
            <select name="built_up_area_unit" class="form-select">
                <option value="sq_ft">sq.ft.</option>
                <option value="sq_yd">sq.yards</option>
                <option value="sq_m">sq.m.</option>
                <option value="acres">acres</option>
            </select>
        </div>
    </div>

    <!-- Super Built-up Area (Hidden Initially) -->
    <div class="col-md-4 mb-3" id="superField">
        <label class="form-label">Super Built-up Area</label>
        <div class="input-group">
            <input type="number"
                   name="super_built_up_area"
                   value="' . old('super_built_up_area', $this->getModel()->super_built_up_area) . '"
                   class="form-control"
                   placeholder="Enter area"
                   min="0"
                   step="any">
            <select name="super_built_up_area_unit" class="form-select">
                <option value="sq_ft">sq.ft.</option>
                <option value="sq_yd">sq.yards</option>
                <option value="sq_m">sq.m.</option>
                <option value="acres">acres</option>
            </select>
        </div>
    </div>

</div>

<script>
document.addEventListener("DOMContentLoaded", function(){

    const builtBtn = document.getElementById("showBuilt");
    const superBtn = document.getElementById("showSuper");

    const builtField = document.getElementById("builtField");
    const superField = document.getElementById("superField");

    builtBtn.addEventListener("click", function(){
        builtField.style.display = "block";
        builtBtn.style.display = "none";
    });

    superBtn.addEventListener("click", function(){
        superField.style.display = "block";
        superBtn.style.display = "none";
    });

});
</script>

'
])




->add('available_from', TextField::class, [
    'label' => 'Available From',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'placeholder' => 'e.g., Immediate, Dec 2024, etc.',
    ],
])
->add('age_of_property', SelectField::class, [
    'label' => 'Age of Property',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        '0-1' => '0-1 Year',
        '1-5' => '1-5 Years',
        '5-10' => '5-10 Years',
        '10+' => '10+ Years',
    ],
])
->add('willing_to_rent', HtmlField::class, [
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'html' => '

    <label class="form-label fw-bold">
        Willing to rent out to
    </label>

    <div class="mt-2 d-flex flex-wrap gap-4">

        <label class="custom-checkbox">
            <input type="checkbox" name="willing_to_rent[]" value="family">
            <span>Family</span>
        </label>

        <label class="custom-checkbox">
            <input type="checkbox" name="willing_to_rent[]" value="single_men">
            <span>Single Men</span>
        </label>

        <label class="custom-checkbox">
            <input type="checkbox" name="willing_to_rent[]" value="single_women">
            <span>Single Women</span>
        </label>

    </div>

    <style>
    .custom-checkbox{
        display:flex;
        align-items:center;
        gap:8px;
        cursor:pointer;
        font-weight:500;
    }
    .custom-checkbox input{
        width:18px;
        height:18px;
        cursor:pointer;
    }
    </style>

    ',
])

//start step 4


 ->add(
                'images[]',
                MediaImagesField::class,
                MediaImagesFieldOption::make()
                    ->label(trans('plugins/real-estate::property.form.images'))
                    ->selected($this->getModel()->id ? $this->getModel()->images : [])
            )
            // Add video field (missing from original)
            ->add(
                'video',
                TextField::class,
                [
                    'label' => 'Add one video of property',
                    'help_block' => [
                        'text' => 'Upload video (max 80MB, .mov format) or add YouTube link (max 10 minutes)',
                    ],
                    'attr' => [
                        'placeholder' => 'Enter YouTube video URL or upload video file',
                    ],
                ]
            )
            
            
            // step 4 end
            
            // Start Step 5
            
            ->add('pricing_section', HtmlField::class, [
'label' => false,
'wrapper' => ['class' => 'form-group mb-4 col-12'],
'html' => '

<style>
.section-title{
    font-size:20px;
    font-weight:600;
    margin-bottom:20px;
}

.sub-heading{
    font-weight:600;
    margin-top:30px;
    margin-bottom:12px;
}

.pill-group{
    display:flex;
    flex-wrap:wrap;
    gap:12px;
}

.pill-option{
    padding:8px 18px;
    border:1px solid #dcdcdc;
    border-radius:30px;
    cursor:pointer;
    transition:all .2s ease;
    user-select:none;
    font-weight:500;
}

.pill-option:hover{
    border-color:#0d6efd;
}

.pill-option.active{
    background:#0d6efd;
    color:#fff;
    border-color:#0d6efd;
}

.hidden-input{
    display:none;
}

.hidden-box{
    display:none;
    margin-top:15px;
}
</style>

<div class="section-title">Add pricing and details...</div>

<!-- Preferred Agreement -->
<div class="sub-heading">Preferred agreement type</div>
<div class="pill-group" data-group="agreement_type">
    <input type="radio" name="agreement_type" value="company" class="hidden-input" id="agreement1">
    <label for="agreement1" class="pill-option">Company lease agreement</label>

    <input type="radio" name="agreement_type" value="any" class="hidden-input" id="agreement2">
    <label for="agreement2" class="pill-option">Any</label>
</div>

<!-- Rent -->
<div class="sub-heading">Rent Details</div>
<input type="number" name="expected_rent" class="form-control mb-3" placeholder="Enter expected rent">

<div class="pill-group" data-group="rent_options">
    <input type="radio" name="rent_option" value="excluded" class="hidden-input" id="rent1">
    <label for="rent1" class="pill-option">Electricity & Water excluded</label>

    <input type="radio" name="rent_option" value="negotiable" class="hidden-input" id="rent2">
    <label for="rent2" class="pill-option">Price Negotiable</label>
</div>

<!-- Security Deposit -->
<div class="sub-heading">Security deposit</div>
<div class="pill-group" data-group="deposit_type">
    <input type="radio" name="deposit_type" value="fixed" class="hidden-input" id="deposit1">
    <label for="deposit1" class="pill-option">Fixed</label>

    <input type="radio" name="deposit_type" value="multiple" class="hidden-input" id="deposit2">
    <label for="deposit2" class="pill-option">Multiple of Rent</label>

    <input type="radio" name="deposit_type" value="none" class="hidden-input" id="deposit3">
    <label for="deposit3" class="pill-option">None</label>
</div>

<div id="depositBox" class="hidden-box">
    <input type="number" name="deposit_value" class="form-control" placeholder="Enter deposit value">
</div>

<!-- Brokerage -->
<div class="sub-heading">Do you charge brokerage?</div>
<div class="pill-group" data-group="brokerage">
    <input type="radio" name="brokerage" value="yes" class="hidden-input" id="broker1">
    <label for="broker1" class="pill-option">Yes</label>

    <input type="radio" name="brokerage" value="no" class="hidden-input" id="broker2">
    <label for="broker2" class="pill-option">No</label>
</div>

<!-- Duration -->
<div class="sub-heading">Duration of agreement</div>
<select name="agreement_duration" class="form-control mb-3">
    <option value="">Select</option>
    <option value="6">6 Months</option>
    <option value="11">11 Months</option>
    <option value="12">12 Months</option>
    <option value="24">24 Months</option>
</select>

<!-- Notice -->
<div class="sub-heading">Months of Notice</div>
<div class="pill-group" data-group="notice_period">
    <input type="radio" name="notice_period" value="none" class="hidden-input" id="notice1">
    <label for="notice1" class="pill-option">None</label>

    <input type="radio" name="notice_period" value="1" class="hidden-input" id="notice2">
    <label for="notice2" class="pill-option">1 month</label>

    <input type="radio" name="notice_period" value="2" class="hidden-input" id="notice3">
    <label for="notice3" class="pill-option">2 months</label>

    <input type="radio" name="notice_period" value="3" class="hidden-input" id="notice4">
    <label for="notice4" class="pill-option">3 months</label>

    <input type="radio" name="notice_period" value="6" class="hidden-input" id="notice5">
    <label for="notice5" class="pill-option">6 months</label>
</div>

<script>
document.addEventListener("DOMContentLoaded", function(){

    // Pill Active Toggle
    document.querySelectorAll(".pill-group").forEach(group => {

        const radios = group.querySelectorAll("input[type=radio]");
        const labels = group.querySelectorAll(".pill-option");

        radios.forEach(radio => {
            radio.addEventListener("change", function(){

                labels.forEach(label => label.classList.remove("active"));
                group.querySelector("label[for="+this.id+"]").classList.add("active");

                // Deposit show logic
                if(this.name === "deposit_type"){
                    const box = document.getElementById("depositBox");
                    if(this.value === "fixed" || this.value === "multiple"){
                        box.style.display = "block";
                    } else {
                        box.style.display = "none";
                    }
                }

            });
        });

    });

});
</script>

'
])


//end step 5

//start step 6
            
            
            
            
    // 👇 IMPORTANT: continue your chain here
  // STEP 6 START
->add('description', TextareaField::class, DescriptionFieldOption::make())

->add('unique_features', TextareaField::class, [
    'label' => 'What makes your property unique?',
    'wrapper' => [
        'class' => 'form-group mb-3',
    ],
    'attr' => [
        'placeholder' => 'Describe what makes your property unique...',
        'rows' => 4,
    ],
])

// FEATURES
->add('features_section', HtmlField::class, [
    'wrapper' => [
        'class' => 'form-group mb-4',
    ],
    'html' => '
        <h4 class="mb-3">Features</h4>
        ' . view(
            'plugins/real-estate::partials.form-features',
            compact('selectedFeatures', 'features')
        )->render() . '
    ',
])

// FACILITIES (Distance Key)
->add('facilities_section', HtmlField::class, [
    'wrapper' => [
        'class' => 'form-group mb-4',
    ],
    'html' => '
        <h4 class="mb-3">Distance Key Between Facilities</h4>
        ' . view(
            'plugins/real-estate::partials.form-facilities',
            compact('facilities', 'selectedFacilities')
        )->render() . '
    ',
])

// FACILITIES / DISTANCE KEY SECTION (Step 6)

            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
            )
            ->addOpenCollapsible('is_featured', '1', $this->model->is_featured == 1)
            ->add(
                'featured_priority',
                NumberField::class,
                [
                    'label' => trans('plugins/real-estate::property.form.featured_priority'),
                    'attr' => [
                        'placeholder' => trans('plugins/real-estate::property.form.featured_priority'),
                        'min' => 0,
                    ],
                    'help_block' => [
                        'text' => trans('plugins/real-estate::property.form.featured_priority_helper'),
                    ],
                    'wrapper' => [
                        'class' => 'mb-0',
                    ],
                ]
            )
            ->addCloseCollapsible('is_featured', '1')
            ->add(
                'content',
                EditorField::class,
                ContentFieldOption::make()
                    ->label(trans('plugins/real-estate::property.form.content'))
                    ->allowedShortcodes()
            )
           
          
            ->add('rowOpen', HtmlField::class, [
                'html' => '<div class="row">',
            ])
            // ->add('latitude', TextField::class, [
            //     'label' => trans('plugins/real-estate::property.form.latitude'),
            //     'wrapper' => [
            //         'class' => 'form-group mb-3 col-md-6',
            //     ],
            //     'attr' => [
            //         'placeholder' => 'Ex: 1.462260',
            //         'data-counter' => 25,
            //     ],
            //     'help_block' => [
            //         'tag' => 'a',
            //         'text' => trans('plugins/real-estate::property.form.latitude_helper'),
            //         'attr' => [
            //             'href' => 'https://www.latlong.net/convert-address-to-lat-long.html',
            //             'target' => '_blank',
            //             'rel' => 'nofollow',
            //         ],
            //     ],
            // ])
            // ->add('longitude', TextField::class, [
            //     'label' => trans('plugins/real-estate::property.form.longitude'),
            //     'wrapper' => [
            //         'class' => 'form-group mb-3 col-md-6',
            //     ],
            //     'attr' => [
            //         'placeholder' => 'Ex: 103.812530',
            //         'data-counter' => 25,
            //     ],
            //     'help_block' => [
            //         'tag' => 'a',
            //         'text' => trans('plugins/real-estate::property.form.longitude_helper'),
            //         'attr' => [
            //             'href' => 'https://www.latlong.net/convert-address-to-lat-long.html',
            //             'target' => '_blank',
            //             'rel' => 'nofollow',
            //         ],
            //     ],
            // ])
            ->add('rowClose', 'html', [
                'html' => '</div>',
            ])
            ->when(RealEstateHelper::isEnabledZipCode(), function (FormAbstract $form): void {
                $form->add(
                    'zip_code',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(trans('plugins/real-estate::property.form.zip_code'))
                        ->placeholder(trans('plugins/real-estate::property.form.zip_code_placeholder'))
                        ->maxLength(20)
                );
            })
            
            ->add('rowOpen1', 'html', [
                'html' => '<div class="row">',
            ])
           
->add('rowClose1', 'html', [
    'html' => '</div>',
])

// END OF CORRECTED BLOCK
            // Add furnishing field (missing from original)
          ->add('furnishing', SelectField::class, [
    'label' => 'Furnishing',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        'unfurnished' => 'Unfurnished',
        'semi-furnished' => 'Semi-Furnished',
        'fully-furnished' => 'Fully Furnished',
    ],
])

->add('furnishing_panel', HtmlField::class, [
    'wrapper' => [
        'class' => 'col-12',
    ],
    'html' => '
    <div id="furnishing-options-panel" style="display:none; border:1px solid #ddd; padding:20px; border-radius:8px; margin-bottom:20px;">
        <h5 class="mb-3">Furnishing Details</h5>

        <div class="row">
            <div class="col-md-4 mb-3">
                <label>Lights</label>
                <input type="number" name="furnishing_details[lights]" class="form-control" min="0" value="0">
            </div>

            <div class="col-md-4 mb-3">
                <label>Fans</label>
                <input type="number" name="furnishing_details[fans]" class="form-control" min="0" value="0">
            </div>

            <div class="col-md-4 mb-3">
                <label>AC</label>
                <input type="number" name="furnishing_details[ac]" class="form-control" min="0" value="0">
            </div>

            <div class="col-md-4 mb-3">
                <label>Beds</label>
                <input type="number" name="furnishing_details[beds]" class="form-control" min="0" value="0">
            </div>

            <div class="col-md-4 mb-3">
                <label>Wardrobe</label>
                <input type="number" name="furnishing_details[wardrobe]" class="form-control" min="0" value="0">
            </div>

            <div class="col-md-4 mb-3">
                <label>TV</label>
                <input type="number" name="furnishing_details[tv]" class="form-control" min="0" value="0">
            </div>
        </div>

        <hr>

        <div class="row">
            <div class="col-md-3">
                <label><input type="checkbox" name="furnishing_details[sofa]" value="1"> Sofa</label>
            </div>
            <div class="col-md-3">
                <label><input type="checkbox" name="furnishing_details[fridge]" value="1"> Fridge</label>
            </div>
            <div class="col-md-3">
                <label><input type="checkbox" name="furnishing_details[stove]" value="1"> Stove</label>
            </div>
            <div class="col-md-3">
                <label><input type="checkbox" name="furnishing_details[washing_machine]" value="1"> Washing Machine</label>
            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {

        function toggleFurnishingPanel() {
            var value = $("select[name=\'furnishing\']").val();

            if (value === "semi-furnished" || value === "fully-furnished") {
                $("#furnishing-options-panel").slideDown();
            } else {
                $("#furnishing-options-panel").slideUp();
            }
        }

        // Run on page load (important for edit mode)
        setTimeout(function() {
            toggleFurnishingPanel();
        }, 300);

        // Listen for change (Select2 safe)
        $(document).on("change", "select[name=\'furnishing\']", function() {
            toggleFurnishingPanel();
        });

    });
    </script>
    ',
])

            // Add parking field (missing from original)
            ->add('parking', SelectField::class, [
                'label' => 'Reserved Parking',
                'wrapper' => [
                    'class' => 'form-group mb-3 col-md-4',
                ],
                'attr' => [
                    'class' => 'select-full',
                ],
                'choices' => [
                    'none' => 'None',
                    'bike' => 'Bike',
                    'car' => 'Car',
                    'both' => 'Both Bike & Car',
                ],
            ])
            // Add ownership field (missing from original)
            ->add('ownership', SelectField::class, [
                'label' => 'Ownership',
                'wrapper' => [
                    'class' => 'form-group mb-3 col-md-4',
                ],
                'attr' => [
                    'class' => 'select-full',
                ],
                'choices' => [
                    'freehold' => 'Freehold',
                    'leasehold' => 'Leasehold',
                    'cooperative' => 'Cooperative Society',
                    'power_of_attorney' => 'Power of Attorney',
                ],
            ])
            ->add('rowOpen2', 'html', [
                'html' => '<div class="row">',
            ])
            ->add('price', TextField::class, [
                'label' => 'Expected Price',
                'wrapper' => [
                    'class' => 'form-group mb-3 col-md-6',
                ],
                'attr' => [
                    'id' => 'price-number',
                    'placeholder' => 'Enter expected price',
                    'class' => 'form-control input-mask-number',
                    'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
                    'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
                ],
            ])
            // Add price per sq.ft field (missing from original)
            ->add('price_per_sqft', TextField::class, [
                'label' => 'Price per sq.ft.',
                'wrapper' => [
                    'class' => 'form-group mb-3 col-md-6',
                ],
                'attr' => [
                    'placeholder' => 'Enter price per square feet',
                    'class' => 'form-control input-mask-number',
                    'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
                    'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
                ],
            ])
            ->add('currency_id', 'customSelect', [
                'label' => trans('plugins/real-estate::property.form.currency'),
                'wrapper' => [
                    'class' => 'form-group mb-3 col-md-6',
                ],
                'attr' => [
                    'class' => 'select-full',
                ],
                'choices' => $currencies,
            ])
            
            ->add('period', 'customSelect', [
                'label' => trans('plugins/real-estate::property.form.period'),
                'required' => true,
                'wrapper' => [
                    'class' => 'form-group mb-3 period-form-group col-md-4' . ($this->getModel()->type != PropertyTypeEnum::RENT ? ' hidden' : null),
                ],
                'attr' => [
                    'class' => 'select-search-full',
                    'id' => 'period',
                ],
                'choices' => PropertyPeriodEnum::labels(),
            ])
            ->add('rowClose2', HtmlField::class, [
                'html' => '</div>',
            ])->add('rowOpen3', 'html', [
    'html' => '<div class="row">',
])


->add('property_category', SelectField::class, [
    'label' => 'Property Category',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        'residential' => 'Residential',
        'commercial' => 'Commercial',
        'industrial' => 'Industrial',
        'agricultural' => 'Agricultural',
    ],
])


->add('floor_no', TextField::class, [
    'label' => 'Floor No',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'placeholder' => 'Enter floor number',
        'type' => 'number',
        'min' => '0',
    ],
])
->add('total_floors', TextField::class, [
    'label' => 'Total Floors',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'placeholder' => 'Enter total floors',
        'type' => 'number',
        'min' => '0',
    ],
])
->add('car_parking', HtmlField::class, [
    'wrapper' => [
        'class' => 'form-group mb-4',
    ],
    'html' => '

    <label class="form-label fw-bold">
        Reserved Parking <small class="text-muted">(Optional)</small>
    </label>

    <div class="row mt-2">

        <div class="col-md-6 d-flex align-items-center justify-content-between">
            <span>Covered Parking</span>
            <div class="d-flex align-items-center">
                <button type="button" class="btn btn-light parking-minus" data-target="covered">-</button>
                <input type="text" id="covered_parking" value="0" readonly class="form-control text-center mx-2" style="width:60px;">
                <button type="button" class="btn btn-light parking-plus" data-target="covered">+</button>
            </div>
        </div>

        <div class="col-md-6 d-flex align-items-center justify-content-between">
            <span>Open Parking</span>
            <div class="d-flex align-items-center">
                <button type="button" class="btn btn-light parking-minus" data-target="open">-</button>
                <input type="text" id="open_parking" value="0" readonly class="form-control text-center mx-2" style="width:60px;">
                <button type="button" class="btn btn-light parking-plus" data-target="open">+</button>
            </div>
        </div>

    </div>

    <input type="hidden" name="car_parking" id="car_parking_hidden">

    <script>
    document.addEventListener("DOMContentLoaded", function(){

        function updateHidden(){
            let covered = document.getElementById("covered_parking").value;
            let open = document.getElementById("open_parking").value;
            document.getElementById("car_parking_hidden").value =
                covered + " Covered, " + open + " Open";
        }

        document.querySelectorAll(".parking-plus").forEach(function(btn){
            btn.addEventListener("click", function(){
                let id = btn.dataset.target + "_parking";
                let input = document.getElementById(id);
                input.value = parseInt(input.value) + 1;
                updateHidden();
            });
        });

        document.querySelectorAll(".parking-minus").forEach(function(btn){
            btn.addEventListener("click", function(){
                let id = btn.dataset.target + "_parking";
                let input = document.getElementById(id);
                if(parseInt(input.value) > 0){
                    input.value = parseInt(input.value) - 1;
                    updateHidden();
                }
            });
        });

        updateHidden();

    });
    </script>

    ',
])





->add('rowClose3', 'html', [
    'html' => '</div>',
])

// Price Details Section
->add('rowOpen4', 'html', [
    'html' => '<div class="row"><h5 class="col-12 mb-3">Price Details</h5>',
])
->add('is_price_negotiable', OnOffField::class, [
    'label' => 'Price Negotiable',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
])
->add('maintenance_charges', TextField::class, [
    'label' => 'Maintenance Charges',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'placeholder' => 'Enter amount',
        'class' => 'form-control input-mask-number',
        'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
        'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
    ],
])
->add('maintenance_charges_period', SelectField::class, [
    'label' => 'Maintenance Period',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        'monthly' => 'Monthly',
        'quarterly' => 'Quarterly',
        'annually' => 'Annually',
    ],
])
->add('annual_dues', TextField::class, [
    'label' => 'Annual Dues',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'placeholder' => 'Enter amount',
        'class' => 'form-control input-mask-number',
        'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
        'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
    ],
])


->add('rowClose4', 'html', [
    'html' => '</div>',
])

// Amenities Section
->add('rowOpen5', 'html', [
    'html' => '<div class="row"><h5 class="col-12 mb-3">Amenities</h5>',
])

->add('rowClose5', 'html', [
    'html' => '</div>',
])

// Location Details Section
->add('rowOpen6', 'html', [
    'html' => '<div>',
])

->add('rowClose6', 'html', [
    'html' => '</div>',
])

// Contact Details Section
->add('rowOpen7', 'html', [
    'html' => '<div class="row"><h5 class="col-12 mb-3">Contact Details</h5>',
])
->add('contact_person_name', TextField::class, [
    'label' => 'Contact Person Name',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'placeholder' => 'Enter contact person name',
    ],
])
->add('contact_person_email', TextField::class, [
    'label' => 'Contact Person Email',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'placeholder' => 'Enter contact person email',
        'type' => 'email',
    ],
])
->add('contact_person_phone', TextField::class, [
    'label' => 'Contact Person Phone',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'placeholder' => 'Enter contact person phone',
        'type' => 'tel',
    ],
])
->add('best_time_to_contact', SelectField::class, [
    'label' => 'Best Time to Contact',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        'morning' => 'Morning (9AM - 12PM)',
        'afternoon' => 'Afternoon (12PM - 5PM)',
        'evening' => 'Evening (5PM - 9PM)',
        'anytime' => 'Anytime',
    ],
])
->add('rowClose7', 'html', [
    'html' => '</div>',
])
            ->add('rera_id', TextField::class, [
    'label' => 'RERA ID',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'placeholder' => 'Enter RERA ID',
    ],
])
->add('transaction_type', SelectField::class, [
    'label' => 'Transaction Type',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        'new' => 'New Property',
        'resale' => 'Resale',
    ],
])
->add('availability_status', SelectField::class, [
    'label' => 'Availability Status',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        'ready' => 'Ready to Move',
        'under_construction' => 'Under Construction',
    ],
])

->add('possession_status', TextField::class, [
    'label' => 'Possession Status',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'placeholder' => 'e.g., Immediate, 6 months, etc.',
    ],
])
->add('facing', SelectField::class, [
    'label' => 'Facing',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        'north' => 'North',
        'south' => 'South',
        'east' => 'East',
        'west' => 'West',
        'north_east' => 'North-East',
        'north_west' => 'North-West',
        'south_east' => 'South-East',
        'south_west' => 'South-West',
    ],
])
->add('overlooking', TextField::class, [
    'label' => 'Overlooking',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'placeholder' => 'e.g., Garden, Park, Road, etc.',
    ],
])
->add('is_non_vegetarian', OnOffField::class, [
    'label' => 'Non-Vegetarian',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
])
->add('is_gated_community', OnOffField::class, [
    'label' => 'Gated Community',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
])
->add('main_entrance', TextField::class, [
    'label' => 'Main Entrance',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-4',
    ],
    'attr' => [
        'placeholder' => 'e.g., East, West, etc.',
    ],
])
->add('water_source', SelectField::class, [
    'label' => 'Water Source',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        'municipal' => 'Municipal',
        'borewell' => 'Borewell',
        'both' => 'Both',
    ],
])
->add('power_backup', SelectField::class, [
    'label' => 'Power Backup',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'class' => 'select-full',
    ],
    'choices' => [
        'full' => 'Full',
        'partial' => 'Partial',
        'none' => 'None',
    ],
])
->add('flooring', TextField::class, [
    'label' => 'Flooring',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'placeholder' => 'e.g., Vitrified Tiles, Marble, etc.',
    ],
])
->add('additional_rooms', SelectField::class, [
    'label' => 'Additional Rooms',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'class' => 'select-full',
        'multiple' => 'multiple',
    ],
    'choices' => [
        'pooja_room' => 'Pooja Room',
        'study_room' => 'Study Room',
        'servant_room' => 'Servant Room',
        'store_room' => 'Store Room',
        'guest_room' => 'Guest Room',
    ],
])



->add('booking_amount', TextField::class, [
    'label' => 'Booking/Token Amount',
    'wrapper' => [
        'class' => 'form-group mb-3 col-md-6',
    ],
    'attr' => [
        'placeholder' => 'Enter amount',
        'class' => 'form-control input-mask-number',
        'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
        'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
    ],
])
            // Add commission field (missing from original)
            ->add('commission', HtmlField::class, [
'wrapper' => ['class' => 'form-group mb-4'],
'html' => '

<label class="form-label fw-bold">
    Do you charge brokerage?
</label>

<div class="mt-2 mb-3">
    <label class="me-3">
        <input type="radio" name="commission_enabled" value="yes"> Yes
    </label>
    <label>
        <input type="radio" name="commission_enabled" value="no" checked> No
    </label>
</div>

<div id="brokerage_section" style="display:none;">

    <div class="mb-3 d-flex gap-2">

        <input type="radio" id="broker_fixed" name="broker_type" value="fixed" checked hidden>
        <label for="broker_fixed" class="broker-pill active">Fixed</label>

        <input type="radio" id="broker_percentage" name="broker_type" value="percentage" hidden>
        <label for="broker_percentage" class="broker-pill">Percentage of Price</label>

    </div>

    <input type="number"
           id="broker_amount"
           class="form-control mb-3"
           placeholder="Enter brokerage here">

    <div>
        <label>
            <input type="checkbox" id="broker_negotiable">
            Brokerage Negotiable
        </label>
    </div>

</div>

<div id="broker_message" class="text-muted" style="display:none;">
    Sell or Rent Property online faster
</div>

<input type="hidden" name="commission" id="commission_hidden">

<style>
.broker-pill{
    padding:8px 18px;
    border:1px solid #dcdcdc;
    border-radius:30px;
    cursor:pointer;
    user-select:none;
}
.broker-pill.active{
    background:#0d6efd;
    color:#fff;
    border-color:#0d6efd;
}
</style>

<script>
document.addEventListener("DOMContentLoaded", function(){

    const enableRadios = document.querySelectorAll("input[name=commission_enabled]");
    const brokerTypeRadios = document.querySelectorAll("input[name=broker_type]");
    const brokerSection = document.getElementById("brokerage_section");
    const brokerMessage = document.getElementById("broker_message");
    const brokerAmount = document.getElementById("broker_amount");
    const negotiable = document.getElementById("broker_negotiable");
    const hidden = document.getElementById("commission_hidden");
    const pills = document.querySelectorAll(".broker-pill");

    function updateHidden(){

        const enabled = document.querySelector("input[name=commission_enabled]:checked").value;

        if(enabled === "no"){
            hidden.value = "No";
            return;
        }

        const type = document.querySelector("input[name=broker_type]:checked").value;
        const amount = brokerAmount.value || 0;
        const neg = negotiable.checked;

        hidden.value = JSON.stringify({
            enabled: true,
            type: type,
            amount: amount,
            negotiable: neg
        });
    }

    enableRadios.forEach(radio => {
        radio.addEventListener("change", function(){

            if(this.value === "yes"){
                brokerSection.style.display = "block";
                brokerMessage.style.display = "none";
            } else {
                brokerSection.style.display = "none";
                brokerMessage.style.display = "block";
            }

            updateHidden();
        });
    });

    brokerTypeRadios.forEach(radio => {
        radio.addEventListener("change", function(){

            pills.forEach(p => p.classList.remove("active"));
            document.querySelector("label[for="+this.id+"]").classList.add("active");

            updateHidden();
        });
    });

    brokerAmount.addEventListener("input", updateHidden);
    negotiable.addEventListener("change", updateHidden);

    updateHidden();

});
</script>

'
])

         
            ->when(RealEstateHelper::isPropertyExpirationEnabled(), function (FormAbstract $form): void {
                $form
                    ->add('never_expired', OnOffField::class, [
                        'label' => trans('plugins/real-estate::property.never_expired'),
                        'default_value' => false,
                        'help_block' => [
                            'text' => trans('plugins/real-estate::property.never_expired_helper'),
                        ],
                    ])
                    ->when(RealEstateHelper::isEnabledAutoRenew(), function (FormAbstract $form): void {
                        $form->add('auto_renew', OnOffField::class, [
                            'label' => trans('plugins/real-estate::property.renew_notice', ['days' => RealEstateHelper::propertyExpiredDays()]),
                            'default_value' => false,
                            'help_block' => [
                                'text' => trans('plugins/real-estate::property.auto_renew_helper'),
                            ],
                        ]);
                    });
            })
            ->add(
                'private_notes',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(trans('plugins/real-estate::property.private_notes'))
                    ->helperText(trans('plugins/real-estate::property.private_notes_helper'))
                    ->rows(2)
                    ->colspan(2)
            )
            ->add(
                'floor_plans',
                RepeaterField::class,
                RepeaterFieldOption::make()
                    ->label(trans('plugins/real-estate::property.floor_plans.title'))
                    ->fields([
                        'name' => [
                            'type' => 'text',
                            'label' => trans('plugins/real-estate::property.floor_plans.name'),
                            'attributes' => [
                                'name' => 'name',
                                'value' => null,
                                'options' => [
                                    'class' => 'form-control',
                                    'data-counter' => 255,
                                ],
                            ],
                        ],
                        'description' => [
                            'type' => 'textarea',
                            'label' => trans('plugins/real-estate::property.floor_plans.description'),
                            'attributes' => [
                                'name' => 'description',
                                'value' => null,
                                'options' => [
                                    'class' => 'form-control',
                                    'rows' => 2,
                                ],
                            ],
                        ],
                        'image' => [
                            'type' => 'mediaImage',
                            'label' => trans('plugins/real-estate::property.floor_plans.image'),
                            'attributes' => [
                                'name' => 'image',
                                'value' => null,
                            ],
                        ],
                        'bedrooms' => [
                            'type' => 'number',
                            'label' => trans('plugins/real-estate::property.floor_plans.bedrooms'),
                            'attributes' => [
                                'name' => 'bedrooms',
                                'value' => null,
                                'options' => [
                                    'class' => 'form-control',
                                    'placeholder' => trans('plugins/real-estate::property.floor_plans.bedrooms_placeholder'),
                                ],
                            ],
                        ],
                        'bathrooms' => [
                            'type' => 'number',
                            'label' => trans('plugins/real-estate::property.floor_plans.bathrooms'),
                            'attributes' => [
                                'name' => 'bathrooms',
                                'value' => null,
                                'options' => [
                                    'class' => 'form-control',
                                    'placeholder' => trans('plugins/real-estate::property.floor_plans.bathrooms_placeholder'),
                                ],
                            ],
                        ],
                    ])
            )
            
            ->add(
                'status',
                SelectField::class,
                StatusFieldOption::make()
                    ->choices(PropertyStatusEnum::labels())
                    ->selected((string) $this->model->status ?: PropertyStatusEnum::SELLING)
            )
            ->when($this->getModel()->exists, function (FormAbstract $form): void {
                $form->add(
                    'moderation_status',
                    HtmlField::class,
                    HtmlFieldOption::make()
                        ->label(trans('plugins/real-estate::property.moderation_status'))
                        ->content(view('plugins/real-estate::partials.moderation-status', [
                            'model' => $this->getModel(),
                        ])->render())
                );
            })
            ->add(
                'unique_id',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/real-estate::property.unique_id'))
                    ->placeholder(trans('plugins/real-estate::property.unique_id'))
                    ->value($this->getModel()->getKey() ? $this->getModel()->unique_id : $this->getModel()->generateUniqueId())
                    ->maxLength(120)
            )
            ->when(! empty($projects), function () use ($projects): void {
                $this
                    ->add('project_id', 'customSelect', [
                        'label' => trans('plugins/real-estate::property.form.project'),
                        'attr' => [
                            'class' => 'select-search-full',
                        ],
                        'choices' => [0 => trans('plugins/real-estate::property.select_project')] + $projects,
                    ]);
            })
            ->setBreakFieldPoint('status')
            ->add(
                'author_id',
                AutocompleteField::class,
                AutocompleteFieldOption::make()
                    ->label(trans('plugins/real-estate::property.account'))
                    ->ajaxUrl(route('account.list'))
                    ->when($this->getModel()->author_id, function (AutocompleteFieldOption $option): void {
                        $option->choices([$this->model->author->id => $this->model->author->name]);
                    })
                    ->emptyValue(trans('plugins/real-estate::property.select_account'))
                    ->allowClear()
            )
            ->when(RealEstateHelper::isEnabledCustomFields() && (! setting('real_estate_show_all_custom_fields_in_form_by_default', false) || $this->getModel()->custom_fields_array), function (FormAbstract $form): void {
                Assets::addScriptsDirectly('vendor/core/plugins/real-estate/js/custom-fields.js');

                $customFields = CustomField::query()->select(['name', 'id', 'type'])->get();

                $form->addMetaBoxes([
                    'custom_fields_box' => [
                        'title' => trans('plugins/real-estate::custom-fields.name'),
                        'content' => view('plugins/real-estate::custom-fields.custom-fields', [
                            'options' => CustomFieldEnum::labels(),
                            'customFields' => $customFields,
                            'model' => $this->model,
                            'ajax' => is_in_admin(true) ? route('real-estate.custom-fields.get-info') : route('public.account.custom-fields.get-info'),
                        ]),
                        'priority' => 0,
                    ],
                ]);
                
            });
            
    }
}