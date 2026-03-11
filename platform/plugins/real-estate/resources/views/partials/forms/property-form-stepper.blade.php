@extends('core/base::forms.form')

@section('content')
    @if ($showStart)
        {!! Form::open(Arr::except($formOptions, ['template'])) !!}
    @endif

    @php
        do_action(BASE_ACTION_TOP_FORM_CONTENT_NOTIFICATION, request(), $form->getModel());
    @endphp

    <style>
    /* Reset and Base Styles */
    * {
        box-sizing: border-box;
    }
    
    /* Ensure form elements are always clickable */
    input, select, textarea, button, label, .form-group, .mb-3, .card-body {
        pointer-events: auto !important;
        position: relative !important;
        z-index: 1 !important;
    }
    
    /* Step Container */
    .stepper-container {
        margin-bottom: 30px;
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        position: relative;
        z-index: 10;
    }
    
    /* Step Indicator */
    .step-indicator {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        flex-wrap: wrap;
        position: relative;
        z-index: 5;
    }
    
    .step-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        flex: 1;
        min-width: 100px;
        position: relative;
        z-index: 6;
        cursor: pointer;
        transition: all 0.3s ease;
        pointer-events: auto !important;
    }
    
    .step-item:hover {
        transform: translateY(-2px);
    }
    
    .step-item:not(:last-child)::after {
        content: '';
        position: absolute;
        top: 20px;
        left: 50%;
        width: calc(100% - 20px);
        height: 2px;
        background: #e9ecef;
        z-index: 1;
        transition: background 0.3s ease;
    }
    
    .step-item.active:not(:last-child)::after {
        background: #0d6efd;
    }
    
    .step-item.completed:not(:last-child)::after {
        background: #28a745;
    }
    
    .step-number {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: #e9ecef;
        border: 2px solid #dee2e6;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        color: #6c757d;
        margin-bottom: 8px;
        position: relative;
        z-index: 7;
        transition: all 0.3s ease;
        pointer-events: auto !important;
    }
    
    .step-item.active .step-number {
        background: #0d6efd;
        color: white;
        border-color: #0d6efd;
        box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1);
    }
    
    .step-item.completed .step-number {
        background: #28a745;
        color: white;
        border-color: #28a745;
        box-shadow: 0 0 0 4px rgba(40, 167, 69, 0.1);
    }
    
    .step-item.completed .step-number::after {
        content: '✓';
        font-size: 18px;
        font-weight: bold;
    }
    
    .step-label {
        font-size: 13px;
        font-weight: 500;
        color: #6c757d;
        text-align: center;
        transition: color 0.3s ease;
        pointer-events: none;
    }
    
    .step-item.active .step-label {
        color: #0d6efd;
        font-weight: 600;
    }
    
    .step-item.completed .step-label {
        color: #28a745;
    }
    
    /* Step Content - CRITICAL FIXES */
    .step-content {
        display: none;
        opacity: 0;
        visibility: hidden;
        transition: opacity 0.3s ease, visibility 0.3s ease;
        margin-bottom: 30px;
        position: relative;
        z-index: 2;
    }
    
    /* First step is visible by default */
.step-content {
    display: none;
}

.step-content.active {
    display: block;
}
    
    .step-content.active {
        display: block !important;
        opacity: 1 !important;
        visibility: visible !important;
        animation: fadeIn 0.3s ease-in;
        z-index: 2 !important;
    }
    
    /* Ensure ALL form elements are clickable and visible */
    .step-content.active {
    display: block !important;
    opacity: 1 !important;
    visibility: visible !important;
}

.step-content {
    display: none;
}
    
    /* Override any hidden states */
   
    
    /* For inline elements */
    .step-content.active .d-flex,
    .step-content.active .btn-group,
    .step-content.active .form-check {
        display: flex !important;
    }
    
    .step-content.active .d-inline,
    .step-content.active .form-check-inline {
        display: inline-block !important;
    }
    
    @keyframes fadeIn {
        from { 
            opacity: 0; 
            transform: translateY(10px); 
        }
        to { 
            opacity: 1; 
            transform: translateY(0); 
        }
    }
    
    .step-header {
        color: #0d6efd;
        font-weight: 600;
        padding-bottom: 15px;
        border-bottom: 2px solid #e9ecef;
        margin-bottom: 25px;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .step-header::before {
        content: '';
        width: 4px;
        height: 24px;
        background: #0d6efd;
        border-radius: 2px;
    }
    
    /* Step Navigation */
    .step-nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 15px;
        margin-top: 30px;
        padding: 20px;
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        border-radius: 8px;
        border-top: 2px solid #0d6efd;
        box-shadow: 0 -2px 10px rgba(0,0,0,0.05);
        position: relative;
        z-index: 10;
    }
    
    .step-btn {
        padding: 12px 30px;
        font-weight: 600;
        border-radius: 6px;
        border: none;
        cursor: pointer;
        transition: all 0.3s ease;
        font-size: 15px;
        min-width: 120px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        position: relative;
        overflow: hidden;
        pointer-events: auto !important;
        z-index: 11 !important;
    }
    
    .step-btn.prev {
        background: white;
        color: #495057;
        border: 1px solid #dee2e6;
    }
    
    .step-btn.prev:hover {
        background: #f8f9fa;
        border-color: #adb5bd;
        transform: translateX(-2px);
    }
    
    .step-btn.next {
        background: #0d6efd;
        color: white;
        margin-left: auto;
    }
    
    .step-btn.next:hover {
        background: #0b5ed7;
        transform: translateX(2px);
        box-shadow: 0 4px 12px rgba(13, 110, 253, 0.3);
    }
    
    .step-btn.submit {
        background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        color: white;
    }
    
    .step-btn.submit:hover {
        background: linear-gradient(135deg, #218838 0%, #1ea085 100%);
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(40, 167, 69, 0.3);
    }
    
    /* Validation Styles */
    .is-invalid {
        border-color: #dc3545 !important;
        box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25) !important;
        animation: shake 0.5s;
    }
    
    .invalid-feedback {
        display: block !important;
        color: #dc3545;
        font-size: 0.875rem;
        margin-top: 0.25rem;
        width: 100%;
        animation: slideDown 0.3s ease;
    }
    
    /* Progress Bar */
    .progress-bar-container {
        margin-bottom: 20px;
        background: #e9ecef;
        border-radius: 10px;
        height: 8px;
        overflow: hidden;
    }
    
    .progress-bar-fill {
        height: 100%;
        background: linear-gradient(90deg, #0d6efd 0%, #6610f2 100%);
        transition: width 0.3s ease;
        border-radius: 10px;
    }
    
    /* Remove loading state completely */
    .form-stepper-loading {
        position: relative;
        min-height: 400px;
    }
    
    /* Ensure no overlay blocks interaction */
    .form-stepper-loading::before,
    .form-stepper-loading::after {
        display: none !important;
        content: none !important;
    }
    
    .form-stepper-ready .form-stepper-loading::before,
    .form-stepper-ready .form-stepper-loading::after {
        display: none !important;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .step-indicator {
            gap: 5px;
        }
        
        .step-label {
            font-size: 11px;
        }
        
        .step-number {
            width: 35px;
            height: 35px;
            font-size: 14px;
        }
        
        .step-nav {
            flex-direction: column;
            gap: 10px;
        }
        
        .step-btn {
            width: 100%;
        }
        
        .step-btn.next {
            margin-left: 0;
        }
    }
</style>

    <!-- Remove loading wrapper to prevent blocking -->
    <div id="form-stepper-wrapper" data-vue-ignore >
        <div class="stepper-container">
            <div class="progress-bar-container">
                <div class="progress-bar-fill" id="progress-bar" style="width: 12.5%;"></div>
            </div>
            <div class="step-indicator">
                <div class="step-item active" data-step="1">
                    <div class="step-number">1</div>
                    <div class="step-label">Intent</div>
                </div>
                <div class="step-item" data-step="2">
                    <div class="step-number">2</div>
                    <div class="step-label">Category</div>
                </div>
                <div class="step-item" data-step="3">
                    <div class="step-number">3</div>
                    <div class="step-label">Location</div>
                </div>
                <div class="step-item" data-step="4">
                    <div class="step-number">4</div>
                    <div class="step-label">Details</div>
                </div>
                <div class="step-item" data-step="5">
                    <div class="step-number">5</div>
                    <div class="step-label">Construction</div>
                </div>
                <div class="step-item" data-step="6">
                    <div class="step-number">6</div>
                    <div class="step-label">Pricing</div>
                </div>
                <div class="step-item" data-step="7">
                    <div class="step-number">7</div>
                    <div class="step-label">Additional</div>
                </div>
                <div class="step-item" data-step="8">
                    <div class="step-number">8</div>
                    <div class="step-label">Owner</div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="gap-3 col-md-9">
                @if ($showFields && $form->hasMainFields())
                    <x-core::card class="mb-3">
                        <x-core::card.body>
                            <div class="{{ $form->getWrapperClass() }}">
                                {{ $form->getOpenWrapperFormColumns() }}

                                @php
                                    // Define step mapping for all fields
                                    $stepMapping = [
                                        // Step 1: Property intent + group/category selection
                                        1 => [
                                            'name', 'type'
                                        ],
                                        // Step 2: Category/subcategory (dynamic)
                                        2 => [
                                            'categories_custom'
                                        ],
                                        // Step 3: Location details
                                        3 => [
                                            'location_heading', 'location_data', 'location',
                                            'city', 'locality', 'sub_locality', 'landmark', 'address', 'pin_code',
                                            'zip_code', 'latitude', 'longitude', 'google_map',
                                            'rowOpen6', 'rowClose6'
                                        ],
                                        // Step 4: Property details (dynamic)
                                        4 => [
                                            'step3_master_open', 'step3_row_open', 'number_bedroom', 'number_bathroom', 'number_balcony',
                                            'step3_row_close', 'all_areas_combined', 'additional_rooms',
                                            'furnishing', 'furnishing_panel', 'car_parking',
                                            'floor_row_open', 'floor_no', 'total_floors', 'floor_type', 'available_type', 'available_from',
                                            'commercial_office_block', 'floor_row_close', 'step3_master_close',
                                            'willing_to_rent', 'pg_section',
                                            'images[]', 'video'
                                        ],
                                        // Step 5: Construction status
                                        5 => [
                                            'availability_status', 'age_of_property', 'possession_by'
                                        ],
                                        // Step 6: Pricing
                                        6 => [
                                            'pricing_section',
                                            'maintenance_charges', 'maintenance_charges_period', 'annual_dues',
                                            'booking_amount', 'brokerage', 'tax_and_govt_charges',
                                            'currency_id', 'period',
                                            'rowOpen4', 'rowClose4'
                                        ],
                                        // Step 7: Additional details
                                        7 => [
                                            'description',
                                            'step6_wrapper_open', 'features', 'facilities_section',
                                            'pet_friendly', 'fire_extinguisher', 'fire_sensors', 'fire_sprinklers', 'fire_hose',
                                            'oxygen_duct', 'no_of_staircases',
                                            'residential_section', 'facing', 'overlooking', 'rera_registered', 'rera_number',
                                            'gated_community', 'power_backup_type', 'water_supply_type', 'corner_property', 'open_sides',
                                            'residential_section_close',
                                            'commercial_section', 'fire_noc', 'retail_details', 'occupancy_certificate', 'lock_in_period',
                                            'escalation_percentage', 'loading_percentage', 'electricity_load', 'dg_backup', 'building_grade',
                                            'commercial_section_close',
                                            'step6_wrapper_close',
                                            'content', 'private_notes', 'floor_plans'
                                        ],
                                        // Step 8: Owner details
                                        8 => [
                                            'owner_details_heading',
                                            'owner_name', 'mobile_number', 'alternate_number', 'owner_email', 'posted_by', 'best_time_to_contact',
                                        ],
                                    ];
                                    
                                    $stepTitles = [
                                        1 => 'Property Intent',
                                        2 => 'Property Category',
                                        3 => 'Location',
                                        4 => 'Property Details',
                                        5 => 'Construction Status',
                                        6 => 'Pricing',
                                        7 => 'Additional Details',
                                        8 => 'Owner Details',
                                    ];
                                    
                                    // Initialize step containers
                                    $stepContainers = [];
                                    foreach (range(1, 8) as $step) {
                                        $stepContainers[$step] = [];
                                    }
                                    
                                    // Group fields by step
                                    foreach ($fields as $key => $field) {
                                        if ($field->getName() == $form->getBreakFieldPoint()) {
                                            break;
                                        }
                                        
                                        if (in_array($field->getName(), $exclude)) {
                                            continue;
                                        }
                                        
                                        $fieldStep = 6; // Default to last step
                                        foreach ($stepMapping as $step => $fieldNames) {
                                            if (in_array($field->getName(), $fieldNames)) {
                                                $fieldStep = $step;
                                                break;
                                            }
                                        }
                                        
                                        $stepContainers[$fieldStep][] = $field;
                                        unset($fields[$key]);
                                    }
                                @endphp

                                @foreach ($stepContainers as $step => $stepFields)
                                    @if (!empty($stepFields))
                                        <div class="step-content" data-step="{{ $step }}">
                                            <h3 class="step-header">
                                                Step {{ $step }}: {{ $stepTitles[$step] ?? 'Step ' . $step }}
                                            </h3>
                                            @foreach ($stepFields as $field)
                                                {!! $field->render() !!}
                                                @if (defined('BASE_FILTER_SLUG_AREA') && $field->getName() == SlugHelper::getColumnNameToGenerateSlug($form->getModel()))
                                                    {!! apply_filters(BASE_FILTER_SLUG_AREA, null, $form->getModel()) !!}
                                                @endif
                                            @endforeach
                                        </div>
                                    @endif
                                @endforeach

                                {{ $form->getCloseWrapperFormColumns() }}
                            </div>

                            <div class="step-nav">
                                <button type="button" class="step-btn prev" id="prev-btn" style="display: none;">
                                    ← Back
                                </button>
                                <button type="button" class="step-btn next" id="next-btn">
                                    Next →
                                </button>
                                <button type="submit" class="step-btn submit" id="submit-btn" style="display: none;">
                                    ✓ Submit Property
                                </button>
                            </div>
                        </x-core::card.body>
                    </x-core::card>
                @endif

                @foreach ($form->getMetaBoxes() as $key => $metaBox)
                    {!! $form->getMetaBox($key) !!}
                @endforeach

                @php
                    do_action(BASE_ACTION_META_BOXES, 'advanced', $form->getModel());
                @endphp
            </div>

            <div class="col-md-3 gap-3 d-flex flex-column-reverse flex-md-column mb-md-0 mb-5">
                {!! $form->getActionButtons() !!}

                @php
                    do_action(BASE_ACTION_META_BOXES, 'top', $form->getModel());
                @endphp

                @foreach ($fields as $field)
                    @if (!in_array($field->getName(), $exclude))
                        @if (in_array($field->getType(), ['hidden', \Botble\Base\Forms\Fields\HiddenField::class]))
                            {!! $field->render() !!}
                        @else
                            <x-core::card class="meta-boxes">
                                <x-core::card.header>
                                    <x-core::card.title>
                                        {!! Form::customLabel($field->getName(), $field->getOption('label'), $field->getOption('label_attr')) !!}
                                    </x-core::card.title>
                                </x-core::card.header>

                                @php
                                    $bodyAttrs = Arr::get($field->getOptions(), 'card-body-attrs', []);

                                    if (!Arr::has($bodyAttrs, 'class')) {
                                        $bodyAttrs['class'] = '';
                                    }

                                    $bodyAttrs['class'] .= ' card-body';
                                @endphp

                                <div {!! Html::attributes($bodyAttrs) !!}>
                                    {!! $field->render([], in_array($field->getType(), ['radio', 'checkbox'])) !!}
                                </div>
                            </x-core::card>
                        @endif
                    @endif
                @endforeach

                @php
                    do_action(BASE_ACTION_META_BOXES, 'side', $form->getModel());
                @endphp
            </div>
        </div>
    </div>

    @if ($showEnd)
        {!! Form::close() !!}
    @endif

    @yield('form_end')

  <script>
document.addEventListener("DOMContentLoaded", function () {

    let currentStep = 1;
    const totalSteps = 8;

    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');
    const submitBtn = document.getElementById('submit-btn');
    const stepItems = document.querySelectorAll('.step-item');
    const progressBar = document.getElementById('progress-bar');
    const form = document.querySelector('form');

    function updateProgressBar() {
        if (progressBar) {
            progressBar.style.width = ((currentStep / totalSteps) * 100) + "%";
        }
    }

    function updateStepDisplay() {

        // Hide all steps
        document.querySelectorAll('.step-content').forEach(el => {
            el.style.display = "none";
            el.classList.remove("active");
        });

        // Show current step
        const activeStep = document.querySelector(`.step-content[data-step="${currentStep}"]`);
        if (activeStep) {
            activeStep.style.display = "block";
            activeStep.classList.add("active");
        }

        // Update step indicators
        stepItems.forEach(item => {
            item.classList.remove("active", "completed");
            const step = parseInt(item.dataset.step);

            if (step === currentStep) {
                item.classList.add("active");
            } else if (step < currentStep) {
                item.classList.add("completed");
            }
        });

        // Buttons control
        if (prevBtn) prevBtn.style.display = currentStep === 1 ? "none" : "inline-flex";
        if (nextBtn) nextBtn.style.display = currentStep === totalSteps ? "none" : "inline-flex";
        if (submitBtn) submitBtn.style.display = currentStep === totalSteps ? "inline-flex" : "none";

        updateProgressBar();
    }

    function validateStep(step) {
        const stepContent = document.querySelector(`.step-content[data-step="${step}"]`);
        if (!stepContent) return true;

        let valid = true;

        const requiredFields = stepContent.querySelectorAll('input[required], select[required], textarea[required]');

        requiredFields.forEach(field => {

            if (field.disabled || field.offsetParent === null) return;

            if (field.type === "checkbox" || field.type === "radio") {
                const checked = stepContent.querySelector(`input[name="${field.name}"]:checked`);
                if (!checked) valid = false;
            } else {
                if (!field.value || field.value.trim() === "") valid = false;
            }
        });

        return valid;
    }

    // NEXT
    if (nextBtn) {
        nextBtn.addEventListener("click", function (e) {
            e.preventDefault();

            if (!validateStep(currentStep)) {
                alert("Please fill all required fields before proceeding.");
                return;
            }

            if (currentStep < totalSteps) {
                currentStep++;
                updateStepDisplay();
            }
        });
    }

    // PREV
    if (prevBtn) {
        prevBtn.addEventListener("click", function (e) {
            e.preventDefault();
            if (currentStep > 1) {
                currentStep--;
                updateStepDisplay();
            }
        });
    }

    // Step click
    stepItems.forEach(item => {
        item.addEventListener("click", function () {
            const step = parseInt(this.dataset.step);

            if (step <= currentStep + 1) {
                currentStep = step;
                updateStepDisplay();
            }
        });
    });

    // Final submit validation
    if (form) {
        form.addEventListener("submit", function (e) {

            for (let i = 1; i <= totalSteps; i++) {
                if (!validateStep(i)) {
                    e.preventDefault();
                    alert("Please complete all required fields before submitting.");
                    return false;
                }
            }
        });
    }

    updateStepDisplay();
});
</script>


@endsection