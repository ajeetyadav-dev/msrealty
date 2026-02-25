<?php

use Botble\Theme\Events\RenderingThemeOptionSettings;
use Botble\Theme\ThemeOption\Fields\SelectField;

app('events')->listen(RenderingThemeOptionSettings::class, function (): void {
    theme_option()
        ->setField([
            'id' => 'primary_color',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'customColor',
            'label' => __('Primary color'),
            'attributes' => [
                'name' => 'primary_color',
                'value' => '#1d5f6f',
            ],
        ])
        ->setField([
            'id' => 'primary_color_hover',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'customColor',
            'label' => __('Hover primary color'),
            'attributes' => [
                'name' => 'primary_color_hover',
                'value' => '#063a5d',
            ],
        ])
        ->setField([
            'id' => 'about-us',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'editor',
            'label' => __('About us'),
            'attributes' => [
                'name' => 'about-us',
                'value' => null,
                'options' => [
                    'class' => 'form-control',
                ],
            ],
        ])
        ->setField([
            'id' => 'hotline',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'text',
            'label' => __('Hotline'),
            'attributes' => [
                'name' => 'hotline',
                'value' => null,
                'options' => [
                    'class' => 'form-control',
                    'placeholder' => 'Hotline',
                    'data-counter' => 30,
                ],
            ],
        ])
        ->setField([
            'id' => 'address',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'text',
            'label' => __('Address'),
            'attributes' => [
                'name' => 'address',
                'value' => null,
                'options' => [
                    'class' => 'form-control',
                    'placeholder' => 'Address',
                    'data-counter' => 120,
                ],
            ],
        ])
        ->setField([
            'id' => 'email',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'email',
            'label' => __('Email'),
            'attributes' => [
                'name' => 'email',
                'value' => null,
                'options' => [
                    'class' => 'form-control',
                    'placeholder' => 'Email',
                    'data-counter' => 120,
                ],
            ],
        ])
        ->setField([
            'id' => 'enable_sticky_header',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'customSelect',
            'label' => __('Enable sticky header?'),
            'attributes' => [
                'name' => 'enable_sticky_header',
                'list' => [
                    'yes' => trans('core/base::base.yes'),
                    'no' => trans('core/base::base.no'),
                ],
                'value' => 'yes',
                'options' => [
                    'class' => 'form-control',
                ],
            ],
        ])
        ->setField([
            'id' => 'show_map_on_properties_page',
            'section_id' => 'opt-text-subsection-real-estate',
            'type' => 'customSelect',
            'label' => __('Show map on properties page?'),
            'attributes' => [
                'name' => 'show_map_on_properties_page',
                'list' => [
                    'yes' => trans('core/base::base.yes'),
                    'no' => trans('core/base::base.no'),
                ],
                'value' => 'yes',
                'options' => [
                    'class' => 'form-control',
                ],
            ],
        ])
        ->setField([
            'id' => 'breadcrumb_background',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'mediaImage',
            'label' => __('Breadcrumb background image (1920x280px)'),
            'attributes' => [
                'name' => 'breadcrumb_background',
                'value' => null,
            ],
        ])
        ->setSection([
            'title' => __('Social links'),
            'desc' => __('Social links'),
            'id' => 'opt-text-subsection-social-links',
            'subsection' => true,
            'icon' => 'ti ti-link',
        ])
        ->setField([
            'id' => 'social_links',
            'section_id' => 'opt-text-subsection-social-links',
            'type' => 'repeater',
            'label' => __('Social links'),
            'attributes' => [
                'name' => 'social_links',
                'value' => null,
                'fields' => [
                    [
                        'type' => 'text',
                        'label' => __('Name'),
                        'attributes' => [
                            'name' => 'social-name',
                            'value' => null,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'type' => 'themeIcon',
                        'label' => __('Icon'),
                        'attributes' => [
                            'name' => 'social-icon',
                            'value' => null,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'type' => 'text',
                        'label' => __('URL'),
                        'attributes' => [
                            'name' => 'social-url',
                            'value' => null,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                ],
            ],
        ])
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_show_map_on_single_detail_page')
                ->label(__('Show map on the property/project detail page'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(100)
        )
        ->setField([
            'id' => 'property_main_slider_items_small',
            'section_id' => 'opt-text-subsection-real-estate',
            'type' => 'number',
            'label' => __('Property main slider items on small screen'),
            'attributes' => [
                'name' => 'property_main_slider_items_small',
                'value' => 1,
                'options' => [
                    'class' => 'form-control',
                    'placeholder' => __('Enter number of items'),
                ],
            ],
            'helper' => __('Number of main slider items to display on small screens (less than 900px)'),
            'priority' => 101,
        ])
        ->setField([
            'id' => 'property_main_slider_items_medium',
            'section_id' => 'opt-text-subsection-real-estate',
            'type' => 'number',
            'label' => __('Property main slider items on medium screen'),
            'attributes' => [
                'name' => 'property_main_slider_items_medium',
                'value' => 2,
                'options' => [
                    'class' => 'form-control',
                ],
            ],
            'helper' => __('Number of main slider items to display on medium screens (900px to 1100px)'),
            'priority' => 102,
        ])
        ->setField([
            'id' => 'property_main_slider_items_large',
            'section_id' => 'opt-text-subsection-real-estate',
            'type' => 'number',
            'label' => __('Property main slider items on large screen'),
            'attributes' => [
                'name' => 'property_main_slider_items_large',
                'value' => 3,
                'options' => [
                    'class' => 'form-control',
                ],
            ],
            'helper' => __('Number of main slider items to display on large screens (greater than 1100px)'),
            'priority' => 103,
        ])
        ->setField([
            'id' => 'property_thumb_slider_items_small',
            'section_id' => 'opt-text-subsection-real-estate',
            'type' => 'number',
            'label' => __('Property thumbnail slider items on small screen'),
            'attributes' => [
                'name' => 'property_thumb_slider_items_small',
                'value' => 2,
                'options' => [
                    'class' => 'form-control',
                ],
            ],
            'helper' => __('Number of thumbnail slider items to display on small screens (less than 900px)'),
            'priority' => 104,
        ])
        ->setField([
            'id' => 'property_thumb_slider_items_medium',
            'section_id' => 'opt-text-subsection-real-estate',
            'type' => 'number',
            'label' => __('Property thumbnail slider items on medium screen'),
            'attributes' => [
                'name' => 'property_thumb_slider_items_medium',
                'value' => 3,
                'options' => [
                    'class' => 'form-control',
                ],
            ],
            'helper' => __('Number of thumbnail slider items to display on medium screens (900px to 1100px)'),
            'priority' => 105,
        ])
        ->setField([
            'id' => 'property_thumb_slider_items_large',
            'section_id' => 'opt-text-subsection-real-estate',
            'type' => 'number',
            'label' => __('Property thumbnail slider items on large screen'),
            'attributes' => [
                'name' => 'property_thumb_slider_items_large',
                'value' => 5,
                'options' => [
                    'class' => 'form-control',
                ],
            ],
            'helper' => __('Number of thumbnail slider items to display on large screens (greater than 1100px)'),
            'priority' => 106,
        ])
        ->setField([
            'id' => 'show_gallery_button',
            'section_id' => 'opt-text-subsection-real-estate',
            'type' => 'customSelect',
            'label' => __('Show Gallery button in property/project detail'),
            'attributes' => [
                'name' => 'show_gallery_button',
                'list' => [
                    'yes' => trans('core/base::base.yes'),
                    'no' => trans('core/base::base.no'),
                ],
                'value' => 'yes',
                'options' => [
                    'class' => 'form-control',
                ],
            ],
            'helper' => __('Enable or disable the Gallery button in property/project detail slider'),
            'priority' => 107,
        ])
        ->setField([
            'id' => 'show_map_button',
            'section_id' => 'opt-text-subsection-real-estate',
            'type' => 'customSelect',
            'label' => __('Show Map button in property/project detail'),
            'attributes' => [
                'name' => 'show_map_button',
                'list' => [
                    'yes' => trans('core/base::base.yes'),
                    'no' => trans('core/base::base.no'),
                ],
                'value' => 'yes',
                'options' => [
                    'class' => 'form-control',
                ],
            ],
            'helper' => __('Enable or disable the Map button in property/project detail slider'),
            'priority' => 108,
        ])
        ->setField([
            'id' => 'footer_logo',
            'section_id' => 'opt-text-subsection-logo',
            'type' => 'mediaImage',
            'label' => __('Footer logo'),
            'priority' => 100,
            'attributes' => [
                'name' => 'footer_logo',
                'value' => null,
                'attributes' => ['allow_thumb' => false],
            ],
            'helper' => __('The main logo will be used if this logo is not set.'),
        ])
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_advanced_search')
                ->label(__('Enable advanced search'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(200)
        )
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_filter_by_floor')
                ->label(__('Enable filter by floor'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(201)
        )
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_filter_by_flat')
                ->label(__('Enable filter by flat'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(202)
        )
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_filter_by_bathroom')
                ->label(__('Enable filter by bathroom'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(203)
        )
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_filter_by_bedroom')
                ->label(__('Enable filter by bedroom'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(204)
        )
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_filter_by_price')
                ->label(__('Enable filter by price'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(205)
        )
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_filter_by_square')
                ->label(__('Enable filter by square'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(206)
        )
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_filter_by_block')
                ->label(__('Enable filter by block'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(207)
        )
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_filter_by_project')
                ->label(__('Enable filter by project'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(208)
        )
        ->setField(
            SelectField::make()
                ->sectionId('opt-text-subsection-real-estate')
                ->name('real_estate_enable_filter_by_amenities')
                ->label(__('Enable filter by amenities'))
                ->defaultValue('yes')
                ->options([
                    'yes' => __('Yes'),
                    'no' => __('No'),
                ])
                ->priority(209)
        );
});
