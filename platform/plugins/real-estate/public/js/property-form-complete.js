/**
 * Complete Property Form Visibility Control v3.0
 * 99acres Style - Full Implementation
 */

$(() => {
    console.log('=== 99acres Style Property Form v3.0 ===');

    // ============================================================
    // 1. RESIDENTIAL CATEGORIES MAPPING
    // ============================================================
    
    const categoryMapping = {
        residential: [
            {
                id: 'apartment',
                label: 'Apartment',
                icon: '🏢',
                hasBedrooms: true,
                subcategories: ['1 RK', '1 BHK', '2 BHK', '3 BHK', '4 BHK', '4+ BHK'],
            },
            {
                id: 'builder_floor',
                label: 'Builder Floor',
                icon: '🏬',
                hasBedrooms: true,
                subcategories: ['Low Rise', 'High Rise', 'Independent Floor'],
            },
            {
                id: 'independent_house',
                label: 'Independent House',
                icon: '🏠',
                hasBedrooms: true,
                subcategories: ['Bungalow', 'Row House', 'Kothi'],
            },
            {
                id: 'villa',
                label: 'Villa',
                icon: '🏛️',
                hasBedrooms: true,
                subcategories: ['Independent Villa', 'Gated Villa', 'Luxury Villa'],
            },
            {
                id: 'plot',
                label: 'Plot',
                icon: '📍',
                hasBedrooms: false,
                subcategories: ['Residential Plot', 'Farm Land', 'Corner Plot'],
            },
        ],
        commercial: {
            office: [
                { id: 'office', label: 'Office', icon: '🏢', subcategories: ['Business Park', 'IT Park', 'SEZ', 'Commercial Building'] },
                { id: 'co_working', label: 'Co-working space', icon: '🧑‍💻', subcategories: ['Hot Desk', 'Dedicated Desk', 'Private Cabin'] },
            ],
            retail: [
                { id: 'shop', label: 'Shop', icon: '🛍️', subcategories: ['High Street', 'Mall', 'Market'] },
                { id: 'showroom', label: 'Showroom', icon: '🏪', subcategories: ['Road-facing', 'Corner', 'Anchor'] },
            ],
            warehouse: [
                { id: 'warehouse', label: 'Warehouse', icon: '🏚️', subcategories: ['Godown', 'Cold Storage', 'Logistics Hub'] },
            ],
            land: [
                { id: 'commercial_land', label: 'Commercial Land', icon: '📍', subcategories: ['Industrial', 'Institutional', 'Mixed Use'] },
            ],
            industry: [
                { id: 'factory', label: 'Factory', icon: '🏭', subcategories: ['Light', 'Heavy'] },
            ],
            hospitality: [
                { id: 'hotel', label: 'Hotel', icon: '🏨', subcategories: ['Hotel', 'Resort', 'Guest House'] },
            ],
        },
    };

    const $subBlock = $('#subcategory_block');
    const $subContainer = $('#subcategory_container');
    const $propertySub = $('#property_subcategory');
    const $commercialSub = $('#commercial_subcategory');

    function resetSubcategory() {
        $propertySub.val('');
        $commercialSub.val('');
        $subContainer.empty();
        $subBlock.addClass('d-none').hide();
    }

    function renderSubcategories(subcategories, mode) {
        resetSubcategory();
        if (!subcategories || !subcategories.length) return;

        const hiddenTarget = mode === 'commercial' ? $commercialSub : $propertySub;

        subcategories.forEach((label, idx) => {
            const id = `subcat_${mode}_${idx}`;
            const chip = `
                <div class="subcat-chip">
                    <input type="radio" id="${id}" name="${mode === 'commercial' ? 'commercial_subcategory_choice' : 'property_subcategory_choice'}" value="${label}">
                    <label for="${id}">${label}</label>
                </div>
            `;
            $subContainer.append(chip);
        });

        $subBlock.removeClass('d-none').fadeIn(150);

        $subContainer.find('input[type="radio"]').on('change', function () {
            hiddenTarget.val($(this).val());
        });
    }

    // ============================================================
    // 2. POPULATE RESIDENTIAL CATEGORIES
    // ============================================================
    
    function populateResidentialCategories() {
        const container = $('#residential-category-container');
        if (!container.length) return;
        
        const categories = categoryMapping.residential;
        container.empty();
        
        categories.forEach((category) => {
            const html = `
                <label class="category-option" data-category="${category.id}" data-has-bedrooms="${category.hasBedrooms}" style="
                    padding: 15px;
                    border: 2px solid #e0e0e0;
                    border-radius: 8px;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    gap: 8px;
                    text-align: center;
                    background-color: #fff;
                ">
                    <input type="radio" name="property_category" value="${category.id}" class="hidden-radio" style="display: none;">
                    <span style="font-size: 28px; line-height: 1;">${category.icon}</span>
                    <span style="font-size: 13px; font-weight: 500; color: #333;">${category.label}</span>
                </label>
            `;
            container.append(html);
        });

        attachCategoryHandlers();
    }

    // ============================================================
    // 3. POPULATE COMMERCIAL CATEGORIES
    // ============================================================
    
    function populateCommercialCategories(commercialType) {
        const container = $('#commercial-sub-category-container');
        if (!container.length) return;
        
        const categories = categoryMapping.commercial[commercialType] || [];
        container.empty();
        
        if (categories.length > 0) {
            categories.forEach((category) => {
                const html = `
                    <label class="category-option" data-category="${category.id}" style="
                        padding: 15px;
                        border: 2px solid #e0e0e0;
                        border-radius: 8px;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        display: inline-flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 8px;
                        text-align: center;
                        background-color: #fff;
                        min-width: 120px;
                    ">
                        <input type="radio" name="commercial_category" value="${category.id}" class="hidden-radio" style="display: none;">
                        <span style="font-size: 28px; line-height: 1;">${category.icon}</span>
                        <span style="font-size: 13px; font-weight: 500; color: #333;">${category.label}</span>
                    </label>
                `;
                container.append(html);
            });
            container.closest('.form-group').removeClass('d-none');

            // attach commercial category handler for subcategories
            container.find('input[type="radio"]').on('change', function () {
                const chosenId = $(this).val();
                const chosen = categories.find(c => c.id === chosenId);
                renderSubcategories(chosen?.subcategories || [], 'commercial');
            });
        } else {
            container.closest('.form-group').addClass('d-none');
        }
    }

    // ============================================================
    // 4. ATTACH CATEGORY HANDLERS
    // ============================================================
    
    function attachCategoryHandlers() {
        const container = $('#residential-category-container');
        if (!container.length) return;
        
        container.find('label.category-option').on('mouseenter', function() {
            $(this).css({
                'border-color': '#2196F3',
                'background-color': '#f0f8ff',
                'box-shadow': '0 2px 8px rgba(33, 150, 243, 0.2)'
            });
        }).on('mouseleave', function() {
            if (!$(this).find('input').is(':checked')) {
                $(this).css({
                    'border-color': '#e0e0e0',
                    'background-color': '#fff',
                    'box-shadow': 'none'
                });
            }
        });

        container.find('input[type="radio"]').on('change', function() {
            const selectedValue = $(this).val();
            const hasBedrooms = $(this).closest('label').data('hasBedrooms') === true || $(this).closest('label').data('hasBedrooms') === 'true';
            console.log('Residential category selected:', selectedValue, 'hasBedrooms:', hasBedrooms);
            
            // Update visual state
            container.find('label.category-option').css({
                'border-color': '#e0e0e0',
                'background-color': '#fff',
                'box-shadow': 'none'
            });
            
            $(this).closest('label').css({
                'border-color': '#4CAF50',
                'background-color': '#f1f8f4',
                'box-shadow': '0 2px 8px rgba(76, 175, 80, 0.3)'
            });
            
            const selected = categoryMapping.residential.find(c => c.id === selectedValue);
            renderSubcategories(selected?.subcategories || [], 'residential');
            updateFieldsBasedOnResidentialCategory(selectedValue, hasBedrooms);
        });
    }

    // ============================================================
    // 5. UPDATE FIELDS BASED ON RESIDENTIAL CATEGORY
    // ============================================================
    
    function updateFieldsBasedOnResidentialCategory(category, hasBedrooms) {
        console.log('Updating residential fields for:', category, 'hasBedrooms:', hasBedrooms);
        
        if (hasBedrooms) {
            // Show bedroom/bathroom/balcony fields
            $('.residential-field').fadeIn(200);
            $('#furnishing-options-panel').fadeIn(200);
        } else {
            // Hide bedroom/bathroom/balcony fields for Plot/Land
            $('.residential-field').fadeOut(200);
            $('#furnishing-options-panel').fadeOut(200);
        }
    }

    // ============================================================
    // 6. PROPERTY GROUP CHANGE (Residential vs Commercial)
    // ============================================================
    
    function handlePropertyGroupChange() {
        const propertyGroup = $('input[name="property_group"]:checked').val();
        console.log('Property group changed to:', propertyGroup);

        if (propertyGroup === 'residential') {
            // Reset commercial selections
            $('input[name="commercial_main_type"]').prop('checked', false);
            $('input[name="commercial_category"]').prop('checked', false);
            $('#commercial-sub-category-container').empty();
            $commercialSub.val('');

            // Show residential categories
            $('#residential-category-block').fadeIn(200).removeClass('d-none');
            $('#commercial_type_container').fadeOut(200).addClass('d-none');
            
            // Show residential fields in Step 3
            populateResidentialCategories();
            resetSubcategory();
            
            // Hide office fields
            $('#office-full-section').fadeOut(200).addClass('d-none');
            
            // Show residential section in Step 6
            $('#residential_section').fadeIn(200).removeClass('d-none');
            $('#commercial_section').fadeOut(200).addClass('d-none');
            
        } else if (propertyGroup === 'commercial') {
            // Reset residential selections
            $('input[name="property_category"]').prop('checked', false);
            $propertySub.val('');

            // Hide residential categories
            $('#residential-category-block').fadeOut(200).addClass('d-none');
            
            // Show commercial type options
            $('#commercial_type_container').fadeIn(200).removeClass('d-none');
            
            // Hide residential fields
            $('.residential-field').fadeOut(200);
            $('#furnishing-options-panel').fadeOut(200);
            resetSubcategory();
            
            // Check which commercial type is selected
            const selectedCommercialType = $('input[name="commercial_main_type"]:checked').val();
            if (selectedCommercialType) {
                handleCommercialMainTypeChange();
            } else {
                // If no commercial type selected yet, hide office fields
                $('#office-full-section').fadeOut(200).addClass('d-none');
            }
            
            // Show commercial section in Step 6
            $('#residential_section').fadeOut(200).addClass('d-none');
            $('#commercial_section').fadeIn(200).removeClass('d-none');
        }
    }

    // ============================================================
    // 7. COMMERCIAL TYPE CHANGE (Office/Retail/Land/Warehouse)
    // ============================================================
    
    function handleCommercialMainTypeChange() {
        const commercialType = $('input[name="commercial_main_type"]:checked').val();
        console.log('Commercial type changed to:', commercialType);
        resetSubcategory();

        // Reset commercial category choice when main type changes
        $('input[name="commercial_category"]').prop('checked', false);
        $('#commercial-sub-category-container').empty();

        // Hide all office modes first
        $('.office-mode').addClass('d-none');
        
        // Always hide office section first
        $('#office-full-section').addClass('d-none').hide();

        if (commercialType === 'office') {
            // Show office section in Step 3
            $('#office-full-section').removeClass('d-none').fadeIn(200);
            
            // Show office ready block by default
            $('#office-ready-block').removeClass('d-none').fadeIn(200);
            
            // Populate office sub-categories
            populateCommercialCategories('office');
            
        } else if (commercialType === 'retail') {
            // Hide office fields, show retail sub-categories
            $('#office-full-section').fadeOut(200).addClass('d-none');
            populateCommercialCategories('retail');
            
        } else if (commercialType === 'land') {
            // Hide office fields
            $('#office-full-section').fadeOut(200).addClass('d-none');
            populateCommercialCategories('land');
            
        } else if (commercialType === 'warehouse') {
            // Hide office fields
            $('#office-full-section').fadeOut(200).addClass('d-none');
            populateCommercialCategories('warehouse');
        } else if (commercialType === 'industry') {
            populateCommercialCategories('industry');
        } else if (commercialType === 'hospitality') {
            populateCommercialCategories('hospitality');
        }

        // Always show commercial section in Step 6
        $('#commercial_section').fadeIn(200).removeClass('d-none');
    }

    // ============================================================
    // 8. PROPERTY TYPE CHANGE (Sale / Rent / PG)
    // ============================================================
    
    function handlePropertyTypeChange() {
        const propertyType = $('#type').val();
        console.log('Property type changed to:', propertyType);
        resetSubcategory();

        // Hide all sections first
        $('#sale_section').hide().addClass('hidden-section');
        $('#rent_section').hide().addClass('hidden-section');
        $('#pg_wrapper').hide().addClass('d-none');
        $('#ownership_wrapper').hide().addClass('hidden-section');
        $('#agreement_section').hide().addClass('hidden-section');
        $('#duration_notice_section').hide().addClass('hidden-section');

        // PG special rule: PG => Residential only
        if (propertyType === 'pg') {
            // force residential selection
            $('input[name="property_group"][value="residential"]').prop('checked', true).trigger('change');

            // hide/disable commercial option
            $('#commercial_option_wrapper').addClass('d-none').hide();
            $('input[name="property_group"][value="commercial"]').prop('checked', false);

            $('#pg_wrapper').removeClass('d-none').fadeIn(200);
            $('.residential-field').fadeOut(200); // mimic 99acres: PG doesn't ask bedrooms counters initially

            // Hide rent/sale sections for PG
            $('#rent_section').hide().addClass('hidden-section');
            $('#sale_section').hide().addClass('hidden-section');
            resetSubcategory();
            return;
        }

        // non-PG => restore commercial option
        $('#commercial_option_wrapper').removeClass('d-none').show();

        if (propertyType === 'sale') {
            $('#sale_section').removeClass('hidden-section').fadeIn(200);
            $('#ownership_wrapper').removeClass('hidden-section').fadeIn(200);
            
        } else if (propertyType === 'rent') {
            $('#rent_section').removeClass('hidden-section').fadeIn(200);
            $('#agreement_section').removeClass('hidden-section').fadeIn(200);
            
            // Show residential specific fields for rent
            const propertyGroup = $('input[name="property_group"]:checked').val();
            if (propertyGroup === 'residential') {
                $('#duration_notice_section').removeClass('hidden-section').fadeIn(200);
            }
            
            // Hide PG section for rent
            $('#pg_wrapper').fadeOut(200).addClass('d-none');
            
        }
    }

    // ============================================================
    // 9. CONSTRUCTION STATUS (Ready vs Under Construction)
    // ============================================================

    function handleConstructionStatusChange() {
        const status = $('#availability_status').val();
        const $age = $('#age_wrapper');
        const $pos = $('#possession_wrapper');

        if (!$age.length || !$pos.length) return;

        if (status === 'ready') {
            $age.removeClass('d-none').fadeIn(150);
            $pos.addClass('d-none').hide();
            $pos.find('input,select,textarea').val('');
        } else if (status === 'under_construction') {
            $pos.removeClass('d-none').fadeIn(150);
            $age.addClass('d-none').hide();
            $age.find('select').val('');
        } else {
            $age.addClass('d-none').hide();
            $pos.addClass('d-none').hide();
        }
    }

    // ============================================================
    // 9. COUNTER HANDLERS
    // ============================================================
    
    function setupCounterFields() {
        // Bedroom counter
        $(document).on('click', '.bedroom-plus', function() {
            let current = parseInt($('#bedroom_count').val()) || 1;
            if (current < 20) {
                current++;
                $('#bedroom_count').val(current);
                $('input[name="number_bedroom"]').val(current);
            }
        });

        $(document).on('click', '.bedroom-minus', function() {
            let current = parseInt($('#bedroom_count').val()) || 1;
            if (current > 1) {
                current--;
                $('#bedroom_count').val(current);
                $('input[name="number_bedroom"]').val(current);
            }
        });

        // Bathroom counter
        $(document).on('click', '.bath-plus', function() {
            let current = parseInt($('#bathroom_count').val()) || 1;
            if (current < 20) {
                current++;
                $('#bathroom_count').val(current);
                $('input[name="number_bathroom"]').val(current);
            }
        });

        $(document).on('click', '.bath-minus', function() {
            let current = parseInt($('#bathroom_count').val()) || 1;
            if (current > 1) {
                current--;
                $('#bathroom_count').val(current);
                $('input[name="number_bathroom"]').val(current);
            }
        });

        // Balcony counter
        $(document).on('click', '.balcony-plus', function() {
            let current = parseInt($('#balcony_count').val()) || 0;
            if (current < 20) {
                current++;
                $('#balcony_count').val(current);
                $('input[name="number_balcony"]').val(current);
            }
        });

        $(document).on('click', '.balcony-minus', function() {
            let current = parseInt($('#balcony_count').val()) || 0;
            if (current > 0) {
                current--;
                $('#balcony_count').val(current);
                $('input[name="number_balcony"]').val(current);
            }
        });

        // Parking counters
        $(document).on('click', '.parking-plus', function() {
            const target = $(this).data('target');
            const inputId = target === 'covered' ? '#covered_parking' : '#open_parking';
            let current = parseInt($(inputId).val()) || 0;
            if (current < 10) {
                current++;
                $(inputId).val(current);
            }
        });

        $(document).on('click', '.parking-minus', function() {
            const target = $(this).data('target');
            const inputId = target === 'covered' ? '#covered_parking' : '#open_parking';
            let current = parseInt($(inputId).val()) || 0;
            if (current > 0) {
                current--;
                $(inputId).val(current);
            }
        });
    }

    // ============================================================
    // 10. AREA FIELDS TOGGLE
    // ============================================================
    
    function setupAreaFields() {
        // Built-up Area toggle
        $('#showBuilt').on('click', function() {
            $('#builtField').fadeIn(200).removeClass('d-none');
            $(this).hide();
        });

        // Super Built-up Area toggle
        $('#showSuper').on('click', function() {
            $('#superField').fadeIn(200).removeClass('d-none');
            $(this).hide();
        });
    }

    // ============================================================
    // 11. INITIALIZATION
    // ============================================================
    
    function initializeForm() {
        console.log('Initializing 99acres style form...');

        // Get initial values
        const propertyGroup = $('input[name="property_group"]:checked').val() || 'residential';
        const propertyType = $('#type').val() || 'sale';
        const commercialType = $('input[name="commercial_main_type"]:checked').val();
        
        console.log('Initial state - Property Group:', propertyGroup, 'Property Type:', propertyType, 'Commercial Type:', commercialType);
        
        // Ensure optional area fields are hidden until enabled
        $('#builtField, #superField').hide().addClass('d-none');

        // Trigger handlers based on initial state
        if (propertyGroup === 'residential') {
            $('#residential-category-block').fadeIn(200).removeClass('d-none');
            $('#commercial_type_container').addClass('d-none');
            populateResidentialCategories();
            
            // Check if a category is already selected
            const selectedCategory = $('input[name="property_category"]:checked').val();
            if (selectedCategory) {
                const hasBedrooms = $(`input[name="property_category"][value="${selectedCategory}"]`).closest('label').data('hasBedrooms');
                updateFieldsBasedOnResidentialCategory(selectedCategory, hasBedrooms);
            } else {
                $('.residential-field').fadeIn(200);
            }
            
            $('#residential_section').removeClass('d-none').fadeIn(200);
            $('#office-full-section').fadeOut(200).addClass('d-none');
        } else {
            $('#residential-category-block').addClass('d-none');
            $('#commercial_type_container').removeClass('d-none').fadeIn(200);
            $('.residential-field').fadeOut(200);
            $('#commercial_section').removeClass('d-none').fadeIn(200);
            
            // Handle commercial type if selected
            if (commercialType) {
                handleCommercialMainTypeChange();
            } else {
                $('#office-full-section').fadeOut(200).addClass('d-none');
            }
        }

        // Handle property type (sale/rent/pg)
        handlePropertyTypeChange();

        // Construction status
        handleConstructionStatusChange();

        // Handle counters
        setupCounterFields();
        
        // Handle area fields
        setupAreaFields();

        console.log('Form initialization complete - 99acres style!');
    }

    // ============================================================
    // 12. EVENT LISTENERS
    // ============================================================
    
    // Property Group change (Residential/Commercial)
    $(document).on('change', 'input[name="property_group"]', function() {
        handlePropertyGroupChange();
    });

    // Property Type change (Sale/Rent/PG)
    $(document).on('change', '#type', function() {
        handlePropertyTypeChange();
    });

    // Construction status change
    $(document).on('change', '#availability_status', function () {
        handleConstructionStatusChange();
    });

    // Commercial main type change (Office/Retail/Land/Warehouse)
    $(document).on('change', 'input[name="commercial_main_type"]', function() {
        handleCommercialMainTypeChange();
    });

    // (Residential category change is handled inside attachCategoryHandlers)

    // ============================================================
    // 13. INITIALIZATION ON DOM READY
    // ============================================================
    
    // Run on page load
    setTimeout(() => {
        initializeForm();
    }, 300);
    
    // Also run when form is rendered (for multi-step forms)
    $(document).on('shown.bs.tab', '.nav-tabs a', function() {
        setTimeout(() => {
            initializeForm();
        }, 100);
    });
    
    // Run when modal is shown
    $(document).on('shown.bs.modal', '.modal', function() {
        setTimeout(() => {
            initializeForm();
        }, 100);
    });
});

console.log('99acres Style Property Form JS Loaded Successfully!');
