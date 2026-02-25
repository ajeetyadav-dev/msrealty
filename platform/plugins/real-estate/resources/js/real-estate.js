$(() => {
    // Handle category filtering based on property type
    const categoryMapping = (() => {
        const widget = document.querySelector('.multi-choices-widget[data-category-mapping]');
        if (widget && widget.dataset.categoryMapping) {
            try {
                return JSON.parse(widget.dataset.categoryMapping);
            } catch (e) {
                console.error('Failed to parse category mapping:', e);
                return {};
            }
        }
        return {};
    })();

    console.log('Category Mapping:', categoryMapping);

    const filterCategories = (type) => {
        console.log('Filtering for type:', type);
        if (!categoryMapping[type]) {
            console.log('No mapping found for type:', type);
            return;
        }

        const widget = document.querySelector('.multi-choices-widget[data-category-mapping]');
        if (!widget) {
            console.log('Widget not found');
            return;
        }

        const allowedCategories = categoryMapping[type];
        const listItems = widget.querySelectorAll('li');

        console.log('Allowed categories:', allowedCategories);
        console.log('Found items:', listItems.length);

        listItems.forEach(li => {
            const categoryName = li.getAttribute('data-category-name') || '';
            console.log('Checking category:', categoryName);
            
            if (allowedCategories.includes(categoryName)) {
                li.style.display = '';
                console.log('Showing:', categoryName);
            } else {
                li.style.display = 'none';
                // Uncheck the checkbox
                const checkbox = li.querySelector('input[type="checkbox"]');
                if (checkbox) {
                    checkbox.checked = false;
                }
                console.log('Hiding:', categoryName);
            }
        });
    };

    $(document).on('change', '#type', (event) => {
        const selectedType = $(event.currentTarget).val();
        console.log('Type changed to:', selectedType);

        // Handle period visibility
        if (selectedType === 'rent') {
            $('#period').closest('.period-form-group').removeClass('hidden').fadeIn()
        } else {
            $('#period').closest('.period-form-group').addClass('hidden').fadeOut()
        }

        // Filter categories
        filterCategories(selectedType);
    })

    // Initialize category filtering on page load
    setTimeout(() => {
        const initialType = $('#type').val();
        console.log('Initial type:', initialType);
        if (initialType && categoryMapping[initialType]) {
            filterCategories(initialType);
        }
    }, 500);

    $(document).on('change', '#never_expired', (event) => {
        if ($(event.currentTarget).is(':checked') === true) {
            $('#auto_renew').closest('.auto-renew-form-group').addClass('hidden').fadeOut()
        } else {
            $('#auto_renew').closest('.auto-renew-form-group').removeClass('hidden').fadeIn()
        }
    })
})



