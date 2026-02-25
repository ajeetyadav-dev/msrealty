@extends('core/base::forms.form')

@section('content')
    @if ($showStart)
        {!! Form::open(Arr::except($formOptions, ['template'])) !!}
    @endif

    @php
        do_action(BASE_ACTION_TOP_FORM_CONTENT_NOTIFICATION, request(), $form->getModel());
    @endphp

    <style>
        .stepper-container {
            margin-bottom: 30px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .step-indicator {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .step-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            flex: 1;
            min-width: 100px;
            position: relative;
        }
        
        .step-item:not(:last-child)::after {
            content: '';
            position: absolute;
            top: 20px;
            left: 50%;
            width: 100%;
            height: 2px;
            background: #e9ecef;
            z-index: 0;
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
            z-index: 1;
            transition: all 0.3s ease;
        }
        
        .step-item.active .step-number {
            background: #0d6efd;
            color: white;
            border-color: #0d6efd;
        }
        
        .step-item.completed .step-number {
            background: #28a745;
            color: white;
            border-color: #28a745;
        }
        
        .step-item.completed .step-number::after {
            content: '✓';
            font-size: 20px;
            font-weight: bold;
        }
        
        .step-label {
            font-size: 13px;
            font-weight: 500;
            color: #6c757d;
            text-align: center;
        }
        
        .step-item.active .step-label {
            color: #0d6efd;
            font-weight: 600;
        }
        
        .step-item.completed .step-label {
            color: #28a745;
        }
        
        /* Hide all steps by default */
        [data-step-id] {
            display: none !important;
        }
        
        /* Show only active step */
        [data-step-id].step-active {
            display: block !important;
            animation: fadeIn 0.3s ease-in;
        }
        
        /* Ensure form groups are visible when step is active */
        [data-step-id].step-active .form-group,
        [data-step-id].step-active .form-check,
        [data-step-id].step-active .mb-3,
        [data-step-id].step-active .mb-4 {
            display: block !important;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .step-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #e9ecef;
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-left: -15px;
            margin-right: -15px;
            margin-bottom: -15px;
        }
        
        .step-btn {
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
            font-size: 15px;
            min-width: 120px;
        }
        
        .step-btn.prev {
            background: #f8f9fa;
            color: #495057;
        }
        
        .step-btn.prev:hover {
            background: #e9ecef;
        }
        
        .step-btn.next {
            background: #0d6efd;
            color: white;
            margin-left: auto;
        }
        
        .step-btn.next:hover {
            background: #0b5ed7;
        }
        
        .step-btn.submit {
            background: #28a745;
            color: white;
        }
        
        .step-btn.submit:hover {
            background: #218838;
        }
        
        .is-invalid {
            border-color: #dc3545 !important;
        }
        
        .invalid-feedback {
            display: block;
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
    </style>

    <div class="stepper-container">
        <div class="step-indicator">
            <div class="step-item active" data-step="1">
                <div class="step-number">1</div>
                <div class="step-label">Basic Info</div>
            </div>
            <div class="step-item" data-step="2">
                <div class="step-number">2</div>
                <div class="step-label">Location</div>
            </div>
            <div class="step-item" data-step="3">
                <div class="step-number">3</div>
                <div class="step-label">Property Details</div>
            </div>
            <div class="step-item" data-step="4">
                <div class="step-number">4</div>
                <div class="step-label">Media</div>
            </div>
            <div class="step-item" data-step="5">
                <div class="step-number">5</div>
                <div class="step-label">Pricing</div>
            </div>
            <div class="step-item" data-step="6">
                <div class="step-number">6</div>
                <div class="step-label">Additional Details</div>
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
                                    // Step 1: Basic Info
                                    1 => [
                                        'name', 'type', 'categories_custom'
                                    ],
                                    // Step 2: Location
                                    2 => [
                                        'location_data', 'location', 'zip_code', 'landmark', 'latitude', 'longitude', 'google_map',
                                        'rowOpen6', 'rowClose6'
                                    ],
                                    // Step 3: Property Details
                                    3 => [
                                        'number_bedroom', 'number_bathroom', 'number_balcony', 'number_floor', 
                                        'counter_script', 'all_areas_combined', 'available_from', 'age_of_property', 
                                        'willing_to_rent', 'furnishing', 'furnishing_panel', 'parking', 'ownership',
                                        'property_category', 'floor_no', 'total_floors', 'car_parking',
                                        'facing', 'overlooking', 'is_non_vegetarian', 'is_gated_community',
                                        'main_entrance', 'water_source', 'power_backup', 'flooring', 'additional_rooms',
                                        'transaction_type', 'availability_status', 'possession_status'
                                    ],
                                    // Step 4: Media
                                    4 => [
                                        'images[]', 'video'
                                    ],
                                    // Step 5: Pricing
                                    5 => [
                                        'pricing_section', 'price', 'price_per_sqft', 'currency_id', 'period',
                                        'is_price_negotiable', 'maintenance_charges', 'maintenance_charges_period',
                                        'annual_dues', 'booking_amount', 'commission', 'rowOpen', 'rowClose',
                                        'rowOpen1', 'rowClose1', 'rowOpen2', 'rowClose2', 'rowOpen3', 'rowClose3',
                                        'rowOpen4', 'rowClose4', 'rowOpen5', 'rowClose5', 'rowOpen7', 'rowClose7'
                                    ],
                                    // Step 6: Additional Details
                                    6 => [
                                        'description', 'content', 'is_featured', 'featured_priority',
                                        'unique_features', 'private_notes', 'floor_plans', 'rera_id',
                                        'contact_person_name', 'contact_person_email', 'contact_person_phone',
                                        'best_time_to_contact'
                                    ],
                                ];
                                
                                $currentStep = 1;
                            @endphp

                            @php
                                $currentStepForHeader = 0;
                                $stepTitles = [
                                    1 => 'Basic Information',
                                    2 => 'Location Details',
                                    3 => 'Property Details',
                                    4 => 'Photos & Video',
                                    5 => 'Pricing Information',
                                    6 => 'Additional Details'
                                ];
                            @endphp

                            @foreach ($fields as $key => $field)
                                @if ($field->getName() == $form->getBreakFieldPoint())
                                    @break
                                @else
                                    @unset($fields[$key])
                                @endif

                                @continue(in_array($field->getName(), $exclude))

                                @php
                                    $fieldStep = 6; // Default to last step
                                    foreach ($stepMapping as $step => $fieldNames) {
                                        if (in_array($field->getName(), $fieldNames)) {
                                            $fieldStep = $step;
                                            break;
                                        }
                                    }
                                    
                                    // Add step header if this is the first field of a new step
                                    $showHeader = false;
                                    if ($fieldStep != $currentStepForHeader) {
                                        $currentStepForHeader = $fieldStep;
                                        $showHeader = true;
                                    }
                                @endphp

                                @if ($showHeader)
                                    <div data-step-id="{{ $fieldStep }}" class="step-section-header" @if($fieldStep == 1) style="display: block;" @else style="display: none;" @endif>
                                        <h3 class="mb-4" style="color: #0d6efd; font-weight: 600; padding-bottom: 15px; border-bottom: 2px solid #e9ecef;">
                                            Step {{ $fieldStep }}: {{ $stepTitles[$fieldStep] ?? 'Step ' . $fieldStep }}
                                        </h3>
                                    </div>
                                @endif

                                <div data-step-id="{{ $fieldStep }}" @if($fieldStep == 1) class="step-active" @endif>
                                    {!! $field->render() !!}
                                </div>

                                @if (defined('BASE_FILTER_SLUG_AREA') && $field->getName() == SlugHelper::getColumnNameToGenerateSlug($form->getModel()))
                                    {!! apply_filters(BASE_FILTER_SLUG_AREA, null, $form->getModel()) !!}
                                @endif
                            @endforeach

                            {{ $form->getCloseWrapperFormColumns() }}
                        </div>

                        <div class="step-nav">
                            <button type="button" class="step-btn prev" id="prev-btn" style="display: none;">← Back</button>
                            <button type="button" class="step-btn next" id="next-btn">Next →</button>
                            <button type="submit" class="step-btn submit" id="submit-btn" style="display: none;">✓ Submit Property</button>
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

    @if ($showEnd)
        {!! Form::close() !!}
    @endif

    @yield('form_end')

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        let currentStep = 1;
        const totalSteps = 6;
        
        const prevBtn = document.getElementById('prev-btn');
        const nextBtn = document.getElementById('next-btn');
        const submitBtn = document.getElementById('submit-btn');
        const stepItems = document.querySelectorAll('.step-item');
        const form = document.querySelector('form');
        
        function updateStepDisplay() {
            // Hide all field wrappers and headers first
            document.querySelectorAll('[data-step-id]').forEach(el => {
                el.classList.remove('step-active');
                el.style.display = 'none';
            });
            
            // Show only current step fields and header
            const currentStepFields = document.querySelectorAll(`[data-step-id="${currentStep}"]`);
            currentStepFields.forEach(el => {
                el.classList.add('step-active');
                el.style.display = 'block';
            });
            
            // Update step indicator
            stepItems.forEach(item => {
                item.classList.remove('active', 'completed');
                const step = parseInt(item.dataset.step);
                if (step === currentStep) {
                    item.classList.add('active');
                } else if (step < currentStep) {
                    item.classList.add('completed');
                }
            });
            
            // Update navigation buttons
            if (currentStep === 1) {
                prevBtn.style.display = 'none';
            } else {
                prevBtn.style.display = 'block';
            }
            
            if (currentStep === totalSteps) {
                nextBtn.style.display = 'none';
                submitBtn.style.display = 'block';
            } else {
                nextBtn.style.display = 'block';
                submitBtn.style.display = 'none';
            }
            
            // Scroll to top of form
            setTimeout(() => {
                const stepperContainer = document.querySelector('.stepper-container');
                if (stepperContainer) {
                    stepperContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            }, 100);
        }
        
        function validateStep(step) {
            const stepFields = document.querySelectorAll(`[data-step-id="${step}"]`);
            let isValid = true;
            const errors = [];
            
            stepFields.forEach(fieldWrapper => {
                // Check for required inputs
                const requiredInputs = fieldWrapper.querySelectorAll('input[required], select[required], textarea[required]');
                requiredInputs.forEach(input => {
                    // Skip hidden inputs
                    if (input.type === 'hidden') return;
                    
                    let value = input.value;
                    
                    // Handle checkboxes
                    if (input.type === 'checkbox' || input.type === 'radio') {
                        const name = input.name;
                        const checked = fieldWrapper.querySelector(`input[name="${name}"]:checked`);
                        if (!checked) {
                            isValid = false;
                            input.classList.add('is-invalid');
                            errors.push(`Please fill in ${input.name || 'this field'}`);
                        } else {
                            input.classList.remove('is-invalid');
                        }
                    } else {
                        if (!value || value.trim() === '') {
                            isValid = false;
                            input.classList.add('is-invalid');
                            errors.push(`Please fill in ${input.name || 'this field'}`);
                        } else {
                            input.classList.remove('is-invalid');
                        }
                    }
                });
                
                // Check for required selects (Select2)
                const requiredSelects = fieldWrapper.querySelectorAll('select[required]');
                requiredSelects.forEach(select => {
                    if (!select.value || select.value === '' || select.value === '0') {
                        isValid = false;
                        select.classList.add('is-invalid');
                        errors.push(`Please select ${select.name || 'this field'}`);
                    } else {
                        select.classList.remove('is-invalid');
                    }
                });
            });
            
            // Show error message if validation fails
            if (!isValid && errors.length > 0) {
                // Remove existing error messages
                document.querySelectorAll('.step-error-message').forEach(el => el.remove());
                
                // Create and show error message
                const errorDiv = document.createElement('div');
                errorDiv.className = 'alert alert-danger step-error-message mt-3';
                errorDiv.innerHTML = '<strong>Please complete all required fields:</strong><ul class="mb-0 mt-2">' + 
                    errors.map(e => '<li>' + e + '</li>').join('') + '</ul>';
                
                const stepNav = document.querySelector('.step-nav');
                stepNav.parentNode.insertBefore(errorDiv, stepNav);
                
                // Scroll to error
                setTimeout(() => {
                    errorDiv.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }, 100);
            } else {
                // Remove error messages
                document.querySelectorAll('.step-error-message').forEach(el => el.remove());
            }
            
            return isValid;
        }
        
        // Next button click handler
        nextBtn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            // Validate current step before proceeding
            if (validateStep(currentStep)) {
                if (currentStep < totalSteps) {
                    currentStep++;
                    updateStepDisplay();
                }
            }
        });
        
        // Previous button click handler
        prevBtn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            if (currentStep > 1) {
                currentStep--;
                updateStepDisplay();
            }
        });
        
        // Allow clicking on step indicators to navigate
        stepItems.forEach(item => {
            item.style.cursor = 'pointer';
            item.addEventListener('click', function() {
                const step = parseInt(this.dataset.step);
                // Allow navigation to completed steps or next step (if current step is validated)
                if (step <= currentStep) {
                    // Can go back to any previous step
                    currentStep = step;
                    updateStepDisplay();
                } else if (step === currentStep + 1) {
                    // Can go to next step only if current step is valid
                    if (validateStep(currentStep)) {
                        currentStep = step;
                        updateStepDisplay();
                    }
                }
            });
        });
        
        // Validate on form submit
        if (form) {
            form.addEventListener('submit', function(e) {
                if (!validateStep(currentStep)) {
                    e.preventDefault();
                    return false;
                }
            });
        }
        
        // Initialize on page load
        updateStepDisplay();
        
        // Also initialize after a short delay to handle any dynamic content
        setTimeout(function() {
            updateStepDisplay();
        }, 500);
        
        // Re-initialize if form content changes (for dynamic fields)
        const observer = new MutationObserver(function(mutations) {
            updateStepDisplay();
        });
        
        const formContainer = document.querySelector('.card-body');
        if (formContainer) {
            observer.observe(formContainer, {
                childList: true,
                subtree: true
            });
        }
    });
    </script>
@endsection
