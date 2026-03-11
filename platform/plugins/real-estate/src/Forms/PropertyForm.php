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
      Assets::addStyles('datetimepicker')
->addScripts('input-mask')
->addStylesDirectly([
'public/vendor/core/plugins/real-estate/css/real-estate.css',
'public/vendor/core/plugins/real-estate/css/custom-property-form.css?v=5',
])
->addScriptsDirectly([
    'https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.min.js',
'vendor/core/plugins/real-estate/js/real-estate.js',
'vendor/core/plugins/real-estate/js/components.js',
'public/vendor/core/plugins/real-estate/js/property-form-complete.js?v=5',
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

        $squareUnit = setting('real_estate_square_unit', 'mÂ²') ? sprintf('(%s)', setting('real_estate_square_unit', 'mÂ²')) : null;

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

<div class="mb-3">
<label class="me-4" id="residential_option_wrapper">
<input type="radio" name="property_group" value="residential" checked>
Residential
</label>

<label id="commercial_option_wrapper">
<input type="radio" name="property_group" value="commercial">
Commercial
</label>
</div>

<!-- RESIDENTIAL -->
<div id="residential-category-block">
<div id="residential-category-container"
style="display:grid;grid-template-columns:repeat(auto-fit,minmax(150px,1fr));gap:15px;">
</div>
</div>

<!-- COMMERCIAL TYPE -->
<div id="commercial_type_container" class="d-none mt-3">

<h5>Select Commercial Type</h5>

<div class="row g-3">

<label class="col-md-3">
<input type="radio" name="commercial_main_type" value="office">
Office
</label>

<label class="col-md-3">
<input type="radio" name="commercial_main_type" value="retail">
Retail
</label>

<label class="col-md-3">
<input type="radio" name="commercial_main_type" value="land">
Land
</label>

<label class="col-md-3">
<input type="radio" name="commercial_main_type" value="warehouse">
Warehouse
</label>

<label class="col-md-3">
<input type="radio" name="commercial_main_type" value="industry">
Industry
</label>

<label class="col-md-3">
<input type="radio" name="commercial_main_type" value="hospitality">
Hospitality
</label>

</div>

<div id="commercial-sub-category-container" class="mt-3"></div>

</div>

<!-- SUB-CATEGORY (Dynamic) -->
<div id="subcategory_block" class="mt-3 d-none">
    <h5 class="mb-2">Select Sub-category</h5>
    <div id="subcategory_container" class="d-flex flex-wrap gap-2"></div>
    <input type="hidden" name="property_subcategory" id="property_subcategory">
    <input type="hidden" name="commercial_subcategory" id="commercial_subcategory">
</div>
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
        'html' => '<h5 class="mb-3"></h5>',
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

// Step 3 (99acres-style) - Location details
->add('city', TextField::class, [
    'label' => 'City',
    'wrapper' => ['class' => 'form-group col-md-4'],
    'attr' => ['placeholder' => 'Enter city'],
])
->add('locality', TextField::class, [
    'label' => 'Locality',
    'wrapper' => ['class' => 'form-group col-md-4'],
    'attr' => ['placeholder' => 'Enter locality'],
])
->add('sub_locality', TextField::class, [
    'label' => 'Sub-locality',
    'wrapper' => ['class' => 'form-group col-md-4'],
    'attr' => ['placeholder' => 'Enter sub-locality'],
])
->add('landmark', TextField::class, [
    'label' => 'Landmark',
    'wrapper' => ['class' => 'form-group col-md-4'],
    'attr' => ['placeholder' => 'Nearby landmark'],
])
->add('address', TextareaField::class, [
    'label' => 'Address',
    'wrapper' => ['class' => 'form-group col-md-8'],
    'attr' => ['rows' => 3, 'placeholder' => 'House no., building, street'],
])
->add('pin_code', TextField::class, [
    'label' => 'Pin Code',
    'wrapper' => ['class' => 'form-group col-md-4'],
    'attr' => ['placeholder' => 'e.g. 110001', 'inputmode' => 'numeric'],
])

            
// Step 2 End

// Step 3 Start
->add('step3_master_open', HtmlField::class, [
    'html' => '<div id="step3_master_block">',
])

->add('step3_row_open', HtmlField::class, [
    'html' => '<div class="row g-3">',
])

->add('number_bedroom', HtmlField::class, [
    'wrapper' => ['class' => 'col-lg-4 col-md-4 col-12 residential-field'],
    'html' => '
        <label class="form-label fw-bold">Number of Bedrooms</label>

        <div class="counter-box mt-2">
            <span>Bedrooms</span>
            <div class="d-flex align-items-center">
                <button type="button" class="btn btn-light bedroom-minus">-</button>
                <input type="text" id="bedroom_count" value="1"
                    readonly class="form-control text-center mx-2">
                <button type="button" class="btn btn-light bedroom-plus">+</button>
            </div>
        </div>

        <input type="hidden" name="number_bedroom" id="number_bedroom_hidden" value="1">
    ',
])

->add('number_bathroom', HtmlField::class, [
    'wrapper' => ['class' => 'col-lg-4 col-md-4 col-12 residential-field'],
    'html' => '
        <label class="form-label fw-bold">Number of Bathrooms</label>

        <div class="counter-box mt-2">
            <span>Bathrooms</span>
            <div class="d-flex align-items-center">
                <button type="button" class="btn btn-light bath-minus">-</button>
                <input type="text" id="bathroom_count" value="1"
                    readonly class="form-control text-center mx-2">
                <button type="button" class="btn btn-light bath-plus">+</button>
            </div>
        </div>

        <input type="hidden" name="number_bathroom" id="number_bathroom_hidden" value="1">
    ',
])

->add('number_balcony', HtmlField::class, [
    'wrapper' => ['class' => 'col-lg-4 col-md-4 col-12 residential-field'],
    'html' => '
        <label class="form-label fw-bold">Number of Balconies</label>

        <div class="counter-box mt-2">
            <span>Balconies</span>
            <div class="d-flex align-items-center">
                <button type="button" class="btn btn-light balcony-minus">-</button>
                <input type="text" id="balcony_count" value="0"
                    readonly class="form-control text-center mx-2">
                <button type="button" class="btn btn-light balcony-plus">+</button>
            </div>
        </div>

        <input type="hidden" name="number_balcony" id="number_balcony_hidden" value="0">
    ',
])

->add('step3_row_close', HtmlField::class, [
    'html' => '</div>',
])

->add('all_areas_combined', HtmlField::class, [
'label' => false,
'wrapper' => ['class' => 'col-12'],
'html' => '



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



'
])
->add('additional_rooms', HtmlField::class, [
    'label' => 'Additional Rooms',
    'wrapper' => [
        'class' => 'col-12 residential-field',
    ],
    'html' => '

    <label class="form-label fw-bold mb-3">
        Additional Rooms
    </label>

    <div class="row">

        <div class="col-md-3 mb-2">
            <label class="room-checkbox">
                <input type="checkbox" name="additional_rooms[]" value="pooja_room">
                Pooja Room
            </label>
        </div>

        <div class="col-md-3 mb-2">
            <label class="room-checkbox">
                <input type="checkbox" name="additional_rooms[]" value="study_room">
                Study Room
            </label>
        </div>

        <div class="col-md-3 mb-2">
            <label class="room-checkbox">
                <input type="checkbox" name="additional_rooms[]" value="servant_room">
                Servant Room
            </label>
        </div>

        <div class="col-md-3 mb-2">
            <label class="room-checkbox">
                <input type="checkbox" name="additional_rooms[]" value="store_room">
                Store Room
            </label>
        </div>

        <div class="col-md-3 mb-2">
            <label class="room-checkbox">
                <input type="checkbox" name="additional_rooms[]" value="guest_room">
                Guest Room
            </label>
        </div>

    </div>

  

    ',
])

   ->add('furnishing', SelectField::class, [
    'label' => 'Furnishing',
    'wrapper' => [
        'class' => 'col-md-4 residential-field',
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
->add('car_parking', HtmlField::class, [
    'wrapper' => [
        'class' => 'form-group mb-4 residential-field',
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
                <input type="text" id="covered_parking" value="0" readonly class="form-control text-center mx-2"  >
                <button type="button" class="btn btn-light parking-plus" data-target="covered">+</button>
            </div>
        </div>

        <div class="col-md-6 d-flex align-items-center justify-content-between">
            <span>Open Parking</span>
            <div class="d-flex align-items-center">
                <button type="button" class="btn btn-light parking-minus" data-target="open">-</button>
                <input type="text" id="open_parking" value="0" readonly class="form-control text-center mx-2"  >
                <button type="button" class="btn btn-light parking-plus" data-target="open">+</button>
            </div>
        </div>

    </div>

    <input type="hidden" name="car_parking" id="car_parking_hidden">



    ',
])
->add('floor_row_open', HtmlField::class, [
    'html' => '<div class="row g-3">',
])

->add('floor_no', TextField::class, [
    'label' => 'Floor No',
    'wrapper' => [
        'class' => 'col-md-4',
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
        'class' => 'col-md-4',
    ],
    'attr' => [
        'placeholder' => 'Enter total floors',
        'type' => 'number',
        'min' => '0',
    ],
])
->add('floor_type', SelectField::class, [
    'label' => 'Floor Type',
    'wrapper' => ['class' => 'col-md-4'],
    'choices' => [
        'basement' => 'Basement',
        'lower_ground' => 'Lower Ground',
        'ground' => 'Ground',
        'upper' => 'Upper Floor',
    ],
])
->add('availability_status', SelectField::class, [
    'label' => 'Availability Status',
    'wrapper' => [
        'class' => 'col-md-4',
    ],
    'attr' => [
        'class' => 'form-control',
        'id' => 'availability_status'
    ],
    'choices' => [
        '' => 'Select Availability Status',
        'ready' => 'Ready to Move',
        'under_construction' => 'Under Construction',
    ],
])

->add('age_of_property', SelectField::class, [
    'label' => 'Age of Property',
    'wrapper' => [
        'class' => 'col-md-6 d-none',
        'id' => 'age_wrapper'
    ],
    'attr' => [
        'class' => 'form-control',
    ],
    'choices' => [
        '' => 'Select Age',
        '0-1' => '0-1 Year',
        '1-5' => '1-5 Years',
        '5-10' => '5-10 Years',
        '10+' => '10+ Years',
    ],
])

->add('possession_by', TextField::class, [
    'label' => 'Possession By',
    'wrapper' => [
        'class' => 'col-md-6 d-none',
        'id' => 'possession_wrapper'
    ],
    'attr' => [
        'type' => 'date',
        'class' => 'form-control',
        'placeholder' => 'Select expected possession date'
    ],
])








->add('available_type', SelectField::class, [
    'label' => 'Availability',
    'wrapper' => ['class' => 'col-md-4'],
    'choices' => [
        'immediate' => 'Immediately',
        'date' => 'Select Date',
    ],
])


->add('available_from', TextField::class, [
    'label' => 'Available From',
    'wrapper' => [
        'class' => 'col-md-4',
    ],
    'attr' => [
        'type' => 'date', // ye must
        'class' => 'form-control',
        'placeholder' => 'Select a date',
    ],
])





            // Add parking field (missing from original)
           
// ->add('number_floor', HtmlField::class, [
//     'wrapper' => ['class' => 'form-group mb-4 col-md-3'],
//     'html' => '

//     <label class="form-label fw-bold">
//         Floor Number
//     </label>

//     <div class="d-flex align-items-center justify-content-between mt-2">
//         <span>Floor</span>
//         <div class="d-flex align-items-center">
//             <button type="button" class="btn btn-light floor-minus">-</button>
//             <input type="text" id="floor_count" value="1" readonly 
//                   class="form-control text-center mx-2"  >
//             <button type="button" class="btn btn-light floor-plus">+</button>
//         </div>
//     </div>

//     <input type="hidden" name="number_floor" id="number_floor_hidden" value="1">

//     ',
// ])
// ->add('counter_script', HtmlField::class, [
//     'wrapper' => ['class' => 'd-none'],
//     'html' => '

// <script>
// document.addEventListener("DOMContentLoaded", function(){

//     function setupCounter(minusClass, plusClass, inputId, hiddenId, min, max) {

//         let input = document.getElementById(inputId);
//         let hidden = document.getElementById(hiddenId);

//         if(!input || !hidden) return;

//         function update() {
//             hidden.value = input.value;
//         }

//         let plusBtn = document.querySelector("." + plusClass);
//         let minusBtn = document.querySelector("." + minusClass);

//         if(plusBtn){
//             plusBtn.addEventListener("click", function(){
//                 if(parseInt(input.value) < max){
//                     input.value = parseInt(input.value) + 1;
//                     update();
//                 }
//             });
//         }

//         if(minusBtn){
//             minusBtn.addEventListener("click", function(){
//                 if(parseInt(input.value) > min){
//                     input.value = parseInt(input.value) - 1;
//                     update();
//                 }
//             });
//         }

//         update();
//     }

//     setupCounter("bath-minus", "bath-plus", "bathroom_count", "number_bathroom_hidden", 1, 10);
//     setupCounter("balcony-minus", "balcony-plus", "balcony_count", "number_balcony_hidden", 0, 10);
//     setupCounter("floor-minus", "floor-plus", "floor_count", "number_floor_hidden", 1, 100);

// });
// </script>

//     ',
// ])

->add('willing_to_rent', HtmlField::class, [
    'wrapper' => [
        'class' => 'form-group mb-4 d-none residential-field',
        'id' => 'willing_to_rent_wrapper'
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

    ',
])

// =========================Office===========================

->add('commercial_office_block', HtmlField::class, [
'wrapper' => ['class' => 'col-12 commercial-field'],
'html' => '

<div id="office_sub_section" class="commercial-sub-section d-none">

<div id="office-full-section" class="mt-4">

<h5 class="fw-bold mb-3">Describe your office setup</h5>

<div class="row g-3">

<div class="col-md-6">
<label>Min no. of Seats</label>
<input type="number" name="min_seats" class="form-control">
</div>

<div class="col-md-6">
<label>Max no. of Seats</label>
<input type="number" name="max_seats" class="form-control">
</div>

<div class="col-md-6">
<label>No. of Workstations</label>
<input type="number" name="workstations" class="form-control">
</div>

<div class="col-md-6">
<label>No. of Cabins</label>
<input type="number" name="cabins" class="form-control">
</div>

<div class="col-md-6">
<label>No. of Meeting Rooms</label>
<input type="number" name="meeting_rooms" class="form-control">
</div>

<div class="col-md-6">
<label>Washrooms</label><br>

<label>
<input type="radio" name="washrooms_ready" value="private"> Private
</label>

<label class="ms-3">
<input type="radio" name="washrooms_ready" value="shared"> Shared
</label>

<label class="ms-3">
<input type="radio" name="washrooms_ready" value="not_available"> Not Available
</label>

</div>

<div class="col-md-6">
<label>Furnishing</label>

<select name="office_furnishing" class="form-control">
<option value="">Select</option>
<option value="fully_furnished">Fully Furnished</option>
<option value="semi_furnished">Semi Furnished</option>
<option value="bare_shell">Bare Shell</option>
</select>

</div>

<div class="col-md-6">
<label>Air Conditioning</label>

<select name="ac_type" class="form-control">
<option value="">Select</option>
<option value="central">Central AC</option>
<option value="split">Split AC</option>
<option value="none">None</option>
</select>

</div>

<div class="col-md-6">
<label>Server Room</label><br>

<label>
<input type="radio" name="server_room" value="yes"> Yes
</label>

<label class="ms-3">
<input type="radio" name="server_room" value="no"> No
</label>

</div>

<div class="col-md-6">
<label>High Speed Internet</label><br>

<label>
<input type="radio" name="internet_available" value="yes"> Available
</label>

<label class="ms-3">
<input type="radio" name="internet_available" value="no"> Not Available
</label>

</div>

</div>

</div>

<!-- BARE SHELL BLOCK -->
<div id="office-bare-block" class="office-mode d-none">

<h5 class="fw-bold mb-3">Bare Shell Details</h5>

<div class="row g-3">

<div class="col-md-6">
<label>Super Built-up Area</label>
<input type="number" name="bare_super_area" class="form-control">
</div>

<div class="col-md-6">
<label>Minimum Leasable Area</label>
<input type="number" name="bare_min_area" class="form-control">
</div>

<div class="col-md-6">
<label>Washrooms</label><br>

<label>
<input type="radio" name="washrooms_bare" value="available"> Available
</label>

<label class="ms-3">
<input type="radio" name="washrooms_bare" value="not_built"> Not built yet
</label>

</div>

</div>

</div>

<!-- CO WORKING BLOCK -->
<div id="office-cowork-block" class="office-mode d-none">

<h5 class="fw-bold mb-3">Co-working Details</h5>

<div class="row g-3">

<div class="col-md-12">
<label>No. of Washrooms</label><br>

<label><input type="radio" name="cowork_washroom" value="none"> None</label>
<label class="ms-3"><input type="radio" name="cowork_washroom" value="shared"> Shared</label>
<label class="ms-3"><input type="radio" name="cowork_washroom" value="1"> 1</label>
<label class="ms-3"><input type="radio" name="cowork_washroom" value="2"> 2</label>
<label class="ms-3"><input type="radio" name="cowork_washroom" value="3"> 3</label>
<label class="ms-3"><input type="radio" name="cowork_washroom" value="4"> 4</label>

</div>

</div>

</div>

<!-- OFFICE FEATURES -->
<div id="office_features_block" class="mt-4 d-none">

<h5 class="fw-bold mb-3">Office Features</h5>

<div class="row g-3">

<div class="col-md-6">
<label>Conference Room</label><br>
<label><input type="radio" name="conference_room" value="available"> Available</label>
<label class="ms-3"><input type="radio" name="conference_room" value="not_available"> Not Available</label>
</div>

<div class="col-md-6">
<label>Reception Area</label><br>
<label><input type="radio" name="reception_area" value="available"> Available</label>
<label class="ms-3"><input type="radio" name="reception_area" value="not_available"> Not Available</label>
</div>

<div class="col-md-6">
<label>Pantry Type</label><br>
<label><input type="radio" name="pantry_type" value="private"> Private</label>
<label class="ms-3"><input type="radio" name="pantry_type" value="shared"> Shared</label>
<label class="ms-3"><input type="radio" name="pantry_type" value="not_available"> Not Available</label>
</div>

<div class="col-md-6">
<label>Lifts</label><br>
<label><input type="radio" name="lifts" value="available"> Available</label>
<label class="ms-3"><input type="radio" name="lifts" value="not_available"> Not Available</label>
</div>

</div>

</div>

</div>
'
])
->add('floor_row_close', HtmlField::class, [
    'html' => '</div>',
])
->add('step3_master_close', HtmlField::class, [
    'html' => '</div>',
])
->add('pg_section', HtmlField::class, [
'wrapper' => ['class' => 'col-12 d-none', 'id'=>'pg_wrapper'],
'html' => '

<h5 class="fw-bold mb-3">PG Details</h5>

<div class="row g-3">

<div class="col-md-4">
<label>PG For</label>
<select name="pg_for" class="form-control">
<option value="boys">Boys</option>
<option value="girls">Girls</option>
<option value="anyone">Anyone</option>
</select>
</div>

<div class="col-md-4">
<label>Sharing Type</label>
<select name="pg_sharing" class="form-control">
<option value="single">Single Sharing</option>
<option value="double">Double Sharing</option>
<option value="triple">Triple Sharing</option>
<option value="four">4 Sharing</option>
<option value="dormitory">Dormitory</option>
</select>
</div>

<div class="col-md-4">
<label>Food Included</label><br>
<label><input type="radio" name="pg_meals" value="yes"> Yes</label>
<label class="ms-3"><input type="radio" name="pg_meals" value="no"> No</label>
</div>

<div class="col-md-4">
<label>Food Type</label>
<select name="food_type" class="form-control">
<option value="veg">Veg</option>
<option value="non_veg">Non Veg</option>
<option value="both">Both</option>
</select>
</div>

<div class="col-md-4">
<label>Entry Time</label>
<input type="time" name="entry_time" class="form-control">
</div>

<div class="col-md-4">
<label>Visitors Allowed</label><br>
<label><input type="radio" name="visitors_allowed" value="yes"> Yes</label>
<label class="ms-3"><input type="radio" name="visitors_allowed" value="no"> No</label>
</div>

</div>


<hr>

<h6 class="fw-bold mt-4">Room Amenities</h6>

<div class="row g-3">

<div class="col-md-3">
<label><input type="checkbox" name="pg_room_amenities[]" value="bed"> Bed</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_room_amenities[]" value="wardrobe"> Wardrobe</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_room_amenities[]" value="study_table"> Study Table</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_room_amenities[]" value="chair"> Chair</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_room_amenities[]" value="ac"> AC</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_room_amenities[]" value="attached_bathroom"> Attached Bathroom</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_room_amenities[]" value="balcony"> Balcony</label>
</div>

</div>


<hr>

<h6 class="fw-bold mt-4">PG Facilities</h6>

<div class="row g-3">

<div class="col-md-3">
<label><input type="checkbox" name="pg_facilities[]" value="wifi"> WiFi</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_facilities[]" value="laundry"> Laundry</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_facilities[]" value="housekeeping"> Housekeeping</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_facilities[]" value="cctv"> CCTV</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_facilities[]" value="lift"> Lift</label>
</div>

<div class="col-md-3">
<label><input type="checkbox" name="pg_facilities[]" value="power_backup"> Power Backup</label>
</div>

</div>


<hr>

<h6 class="fw-bold mt-4">Rules</h6>

<div class="row g-3">

<div class="col-md-4">
<label>Smoking Allowed</label><br>
<label><input type="radio" name="smoking_allowed" value="yes"> Yes</label>
<label class="ms-3"><input type="radio" name="smoking_allowed" value="no"> No</label>
</div>

<div class="col-md-4">
<label>Drinking Allowed</label><br>
<label><input type="radio" name="drinking_allowed" value="yes"> Yes</label>
<label class="ms-3"><input type="radio" name="drinking_allowed" value="no"> No</label>
</div>

<div class="col-md-4">
<label>Pets Allowed</label><br>
<label><input type="radio" name="pets_allowed" value="yes"> Yes</label>
<label class="ms-3"><input type="radio" name="pets_allowed" value="no"> No</label>
</div>

</div>

'
])
// ->add('pg_section', HtmlField::class, [
//     'wrapper' => ['class' => 'col-12 d-none', 'id'=>'pg_wrapper'],
//     'html' => '
//     <h5 class="fw-bold">PG Details</h5>

//     <div class="row g-3">

//         <div class="col-md-4">
//             <label>Sharing Type</label>
//             <select name="pg_sharing" class="form-control">
//                 <option value="single">Single</option>
//                 <option value="double">Double</option>
//                 <option value="triple">Triple</option>
//             </select>
//         </div>

//         <div class="col-md-4">
//             <label>Meals Included</label><br>
//             <label><input type="radio" name="pg_meals" value="yes"> Yes</label>
//             <label class="ms-3"><input type="radio" name="pg_meals" value="no"> No</label>
//         </div>

//     </div>
//     '
// ])
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
'wrapper' => ['class' => 'form-group col-12'],
'html' => <<<HTML



<div class="section-title">Add pricing and details...</div>

<!-- ================= SALE PRICE ================= -->
<div id="sale_section">

    <div id="ownership_wrapper" class="hidden-section">
        <div class="sub-heading">Ownership</div>
        <div class="pill-group">
            <input type="radio" name="ownership" value="freehold" id="own1" class="hidden-input">
            <label for="own1" class="pill-option">Freehold</label>

            <input type="radio" name="ownership" value="leasehold" id="own2" class="hidden-input">
            <label for="own2" class="pill-option">Leasehold</label>

            <input type="radio" name="ownership" value="cooperative" id="own3" class="hidden-input">
            <label for="own3" class="pill-option">Co-operative society</label>

            <input type="radio" name="ownership" value="poa" id="own4" class="hidden-input">
            <label for="own4" class="pill-option">Power of Attorney</label>
        </div>
    </div>

    <div class="sub-heading">Price Details</div>

    <div class="price-row">
        <input type="number" name="expected_price" class="form-control" placeholder="â‚¹ Expected Price">
        <input type="number" name="price_per_sqft" class="form-control" placeholder="â‚¹ Price per sq.ft.">
    </div>

    <div class="d-flex gap-4 mt-3">
        <label><input type="checkbox" name="all_inclusive"> All inclusive price</label>
        <label><input type="checkbox" name="tax_excluded"> Tax & Govt. charges excluded</label>
        <label><input type="checkbox" name="price_negotiable"> Price Negotiable</label>
    </div>

</div>

<!-- ================= RENT SECTION ================= -->
<div id="rent_section" class="hidden-section">

    <!-- Residential Only -->
    <div id="agreement_section" class="hidden-section">
        <div class="sub-heading">Preferred agreement type</div>
        <div class="pill-group">
            <input type="radio" name="agreement_type" value="company" id="agr1" class="hidden-input">
            <label for="agr1" class="pill-option">Company lease agreement</label>

            <input type="radio" name="agreement_type" value="any" id="agr2" class="hidden-input">
            <label for="agr2" class="pill-option">Any</label>
        </div>
    </div>

    <div class="sub-heading">Rent Details</div>
    <input type="number" name="expected_rent" class="form-control mb-3" placeholder="Enter expected rent">

    <div class="pill-group">
        <input type="radio" name="rent_option" value="excluded" id="rent1" class="hidden-input">
        <label for="rent1" class="pill-option">Electricity & Water excluded</label>

        <input type="radio" name="rent_option" value="negotiable" id="rent2" class="hidden-input">
        <label for="rent2" class="pill-option">Price Negotiable</label>
    </div>

    <div class="sub-heading">Security Deposit</div>
    <div class="pill-group">
        <input type="radio" name="deposit_type" value="fixed" id="dep1" class="hidden-input">
        <label for="dep1" class="pill-option">Fixed</label>

        <input type="radio" name="deposit_type" value="multiple" id="dep2" class="hidden-input">
        <label for="dep2" class="pill-option">Multiple of Rent</label>

        <input type="radio" name="deposit_type" value="none" id="dep3" class="hidden-input">
        <label for="dep3" class="pill-option">None</label>
    </div>

    <input type="number" name="deposit_value" id="depositBox"
           class="form-control mt-3 hidden-section"
           placeholder="Enter deposit value">

    <!-- Residential Only -->
    <div id="duration_notice_section" class="hidden-section">

        <div class="sub-heading">Duration of agreement</div>
        <select name="agreement_duration" class="form-control mb-3">
            <option value="">Select</option>
            <option value="6">6 Months</option>
            <option value="11">11 Months</option>
            <option value="12">12 Months</option>
            <option value="24">24 Months</option>
        </select>

        <div class="sub-heading">Months of Notice</div>
        <div class="pill-group">
            <input type="radio" name="notice_period" value="1" id="n1" class="hidden-input">
            <label for="n1" class="pill-option">1 month</label>

            <input type="radio" name="notice_period" value="2" id="n2" class="hidden-input">
            <label for="n2" class="pill-option">2 months</label>

            <input type="radio" name="notice_period" value="3" id="n3" class="hidden-input">
            <label for="n3" class="pill-option">3 months</label>
        </div>

    </div>

</div>

<!-- UNIQUE -->
<div class="sub-heading">What makes your property unique?</div>
<textarea name="unique_features"
maxlength="1000"
class="form-control"
oninput="document.getElementById('charCount').innerText=this.value.length"
placeholder="Highlight special features..."></textarea>

<small><span id="charCount">0</span>/1000</small>



HTML
])




->add('description', TextareaField::class, [
    'label' => 'Property Description',
    'wrapper' => [
        'class' => 'form-group mb-4 col-12',
    ],
    'attr' => [
        'rows' => 5,
        'placeholder' => 'Describe your property in detail...',
    ],
])


//end step 5

//start step 6
            
            
            
            
    // ðŸ‘‡ IMPORTANT: continue your chain here
  // STEP 6 START


// FEATURES
// ================== STEP 6 START ==================
->add('step6_wrapper_open', HtmlField::class, [
    'html' => '<div id="step6_wrapper"><div class="row g-3">',
])

/* ================= AMENITIES ================= */

->add('features', HtmlField::class, [
    'wrapper' => ['class' => 'col-12'],
    'html' => '
        <h4 class="mb-3">Amenities / Unique Features</h4>
        <div class="row">
            ' . view(
                "plugins/real-estate::partials.form-features",
                compact("features", "selectedFeatures")
            )->render() . '
        </div>
    ',
])
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
/* ================= OTHER FEATURES ================= */

->add('pet_friendly', OnOffField::class, [
    'label' => 'Pet Friendly',
    'wrapper' => ['class' => 'col-md-4'],
])

/* ================= FIRE SAFETY ================= */

->add('fire_extinguisher', OnOffField::class, [
    'label' => 'Fire Extinguisher',
    'wrapper' => ['class' => 'form-group'],
])

->add('fire_sensors', OnOffField::class, [
    'label' => 'Fire Sensors',
    'wrapper' => ['class' => 'col-md-3'],
])

->add('fire_sprinklers', OnOffField::class, [
    'label' => 'Fire Sprinklers',
    'wrapper' => ['class' => 'col-md-3'],
])

->add('fire_hose', OnOffField::class, [
    'label' => 'Fire Hose',
    'wrapper' => ['class' => 'col-md-3'],
])

/* ================= FACILITIES ================= */

->add('oxygen_duct', 'customRadio', [
    'label' => 'Oxygen Duct',
    'wrapper' => ['class' => 'col-md-4'],
    'choices' => [
        'available' => 'Available',
        'not_available' => 'Not Available',
    ],
])

/* ================= NO OF STAIRCASES ================= */

->add('no_of_staircases', SelectField::class, [
    'label' => 'No. of Staircases',
    'wrapper' => ['class' => 'col-md-4'],
    'choices' => [
        1 => '1',
        2 => '2',
        3 => '3',
        4 => '4',
    ],
])

/* ================= RESIDENTIAL SECTION ================= */

->add('residential_section', HtmlField::class, [
    'html' => '<div id="residential_section" class="col-12 d-none">',
])

->add('facing', SelectField::class, [
    'label' => 'Facing',
    'wrapper' => ['class' => 'col-md-6'],
    'choices' => [
        'north'=>'North','south'=>'South','east'=>'East','west'=>'West',
        'north_east'=>'North-East','north_west'=>'North-West',
        'south_east'=>'South-East','south_west'=>'South-West',
    ],
])

->add('overlooking', TextField::class, [
    'label' => 'Overlooking',
    'wrapper' => ['class'=>'col-md-6'],
])
->add('rera_registered', OnOffField::class, [
    'label' => 'RERA Registered',
    'wrapper' => ['class' => 'col-md-4'],
])

->add('rera_number', TextField::class, [
    'label' => 'RERA Number',
    'wrapper' => ['class' => 'col-md-4 d-none', 'id'=>'rera_number_wrapper'],
])

->add('gated_community', OnOffField::class, [
    'label'=>'Gated Community',
    'wrapper'=>['class'=>'col-md-4'],
])

->add('power_backup_type', SelectField::class, [
    'label'=>'Power Backup',
    'choices'=>[
        'none'=>'None',
        'partial'=>'Partial',
        'full'=>'Full',
    ],
])

->add('water_supply_type', SelectField::class, [
    'label'=>'Water Supply',
    'choices'=>[
        'municipal'=>'Municipal',
        'borewell'=>'Borewell',
        'both'=>'Both',
    ],
])

->add('corner_property', OnOffField::class, [
    'label'=>'Corner Property',
])

->add('open_sides', SelectField::class, [
    'label'=>'Open Sides',
    'choices'=>[1=>1,2=>2,3=>3,4=>4],
])
->add('residential_section_close', HtmlField::class, [
    'html' => '</div>',
])

/* ================= COMMERCIAL SECTION ================= */

->add('commercial_section', HtmlField::class, [
    'html' => '<div id="commercial_section" class="col-12 d-none">',
])

->add('fire_noc', OnOffField::class, [
    'label'=>'Fire NOC Certified',
    'wrapper'=>['class'=>'col-md-4'],
])
->add('retail_details', HtmlField::class, [
    'wrapper' => ['class' => 'col-12'],
    'html' => '

<div id="retail_sub_section" class="commercial-sub-section d-none">

    <h5 class="fw-bold mt-4 mb-3">Retail Details</h5>

    <div class="row g-3">

        <div class="col-md-6">
            <label>Entrance Width (ft.)</label>
            <input type="number" name="entrance_width" class="form-control">
        </div>

        <div class="col-md-6">
            <label>Ceiling Height (ft.)</label>
            <input type="number" name="ceiling_height" class="form-control">
        </div>

        <div class="col-md-6">
            <label>Private Washroom</label><br>
            <label><input type="radio" name="private_washroom" value="yes"> Yes</label>
            <label class="ms-3"><input type="radio" name="private_washroom" value="no"> No</label>
        </div>

    </div>

</div>

'
])
->add('occupancy_certificate', OnOffField::class, [
    'label'=>'Occupancy Certificate',
    'wrapper'=>['class'=>'col-md-4'],
])
->add('lock_in_period', NumberField::class, [
    'label'=>'Lock-in Period (Months)',
])

->add('escalation_percentage', NumberField::class, [
    'label'=>'Escalation %',
])

->add('loading_percentage', NumberField::class, [
    'label'=>'Loading %',
])

->add('electricity_load', NumberField::class, [
    'label'=>'Electricity Load (KW)',
])

->add('dg_backup', OnOffField::class, [
    'label'=>'DG Backup',
])

->add('building_grade', SelectField::class, [
    'label'=>'Building Grade',
    'choices'=>[
        'A'=>'Grade A',
        'B'=>'Grade B',
        'C'=>'Grade C',
    ],
])
->add('commercial_section_close', HtmlField::class, [
    'html' => '</div>',
])

->add('step6_wrapper_close', HtmlField::class, [
    'html' => '</div></div>',
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
            
        


           
            ->add('rowOpen2', 'html', [
                'html' => '<div class="row">',
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







->add('rowClose3', 'html', [
    'html' => '</div>',
])
->add('title_clear', OnOffField::class, [
    'label'=>'Title Clear',
])

->add('bank_approved', OnOffField::class, [
    'label'=>'Bank Approved',
])

->add('loan_available', OnOffField::class, [
    'label'=>'Loan Available',
])

->add(
    'completion_certificate',
    MediaImagesField::class,
    MediaImagesFieldOption::make()
        ->label('Completion Certificate')
)
// Price Details Section
->add('rowOpen4', 'html', [
    'html' => '<div class="row"><h5 class="col-12 mb-3">Price Details</h5>',
])

->add('maintenance_charges', TextField::class, [
    'label' => 'Maintenance Charges',
    'wrapper' => [
        'class' => 'col-md-4',
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
        'class' => 'col-md-4',
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
        'class' => 'col-md-4',
    ],
    'attr' => [
        'placeholder' => 'Enter amount',
        'class' => 'form-control input-mask-number',
        'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
        'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
    ],
])

// Extra pricing fields (99acres-like)
->add('booking_amount', TextField::class, [
    'label' => 'Booking Amount',
    'wrapper' => ['class' => 'col-md-4'],
    'attr' => [
        'placeholder' => 'Enter booking amount',
        'class' => 'form-control input-mask-number',
        'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
        'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
    ],
])
->add('brokerage', TextField::class, [
    'label' => 'Brokerage',
    'wrapper' => ['class' => 'col-md-4'],
    'attr' => [
        'placeholder' => 'Enter brokerage',
        'class' => 'form-control input-mask-number',
        'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
        'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
    ],
])
->add('tax_and_govt_charges', TextField::class, [
    'label' => 'Tax and Government Charges',
    'wrapper' => ['class' => 'col-md-4'],
    'attr' => [
        'placeholder' => 'Enter tax / govt charges',
        'class' => 'form-control input-mask-number',
        'data-thousands-separator' => RealEstateHelper::getThousandSeparatorForInputMask(),
        'data-decimal-separator' => RealEstateHelper::getDecimalSeparatorForInputMask(),
    ],
])

// Step 8 - Owner details
->add('owner_details_heading', HtmlField::class, [
    'wrapper' => ['class' => 'col-12'],
    'html' => '<h4 class="mb-3">Owner Details</h4>',
])
->add('owner_name', TextField::class, [
    'label' => 'Owner Name',
    'wrapper' => ['class' => 'col-md-6'],
    'attr' => ['placeholder' => 'Enter owner name'],
])
->add('mobile_number', TextField::class, [
    'label' => 'Mobile Number',
    'wrapper' => ['class' => 'col-md-6'],
    'attr' => ['placeholder' => 'Enter mobile number', 'inputmode' => 'numeric'],
])
->add('alternate_number', TextField::class, [
    'label' => 'Alternate Number',
    'wrapper' => ['class' => 'col-md-6'],
    'attr' => ['placeholder' => 'Enter alternate number', 'inputmode' => 'numeric'],
])
->add('owner_email', TextField::class, [
    'label' => 'Email',
    'wrapper' => ['class' => 'col-md-6'],
    'attr' => ['placeholder' => 'Enter email', 'type' => 'email'],
])
->add('posted_by', SelectField::class, [
    'label' => 'You are a',
    'wrapper' => ['class' => 'col-md-6'],
    'choices' => [
        '' => 'Select',
        'owner' => 'Owner',
        'broker' => 'Broker',
        'builder' => 'Builder',
    ],
])
->add('best_time_to_contact', SelectField::class, [
    'label' => 'Best time to contact',
    'wrapper' => ['class' => 'col-md-6'],
    'choices' => [
        '' => 'Select',
        'morning' => 'Morning (9AM - 12PM)',
        'afternoon' => 'Afternoon (12PM - 4PM)',
        'evening' => 'Evening (4PM - 8PM)',
        'anytime' => 'Anytime',
    ],
])


->add('rowClose4', 'html', [
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
    'html' => '<div>',
])

->add('rowClose7', 'html', [
    'html' => '</div>',
])

->add('is_non_vegetarian', OnOffField::class, [
    'label' => 'Non-Vegetarian',
    'wrapper' => [
        'class' => 'col-md-4',
    ],
])

->add('main_entrance', TextField::class, [
    'label' => 'Main Entrance',
    'wrapper' => [
        'class' => 'col-md-4',
    ],
    'attr' => [
        'placeholder' => 'e.g., East, West, etc.',
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
