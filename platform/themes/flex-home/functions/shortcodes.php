<?php

use Botble\Base\Facades\BaseHelper;
use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Supports\RepositoryHelper;
use Botble\Blog\Models\Category;
use Botble\Blog\Models\Post;
use Botble\Location\Models\City;
use Botble\Location\Models\State;
use Botble\RealEstate\Enums\PropertyTypeEnum;
use Botble\RealEstate\Facades\RealEstateHelper;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Models\Category as RealEstateCategory;
use Botble\RealEstate\Models\Investor;
use Botble\RealEstate\Models\Package;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Shortcode\Compilers\Shortcode;
use Botble\Shortcode\Facades\Shortcode as ShortcodeFacade;
use Botble\Shortcode\Forms\FieldOptions\ShortcodeTabsFieldOption;
use Botble\Shortcode\Forms\Fields\ShortcodeTabsField;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\App;

app('events')->listen(RouteMatched::class, function (): void {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    if (is_plugin_active('real-estate')) {
        add_shortcode('featured-projects', __('Featured projects'), __('Featured projects'), function (Shortcode $shortcode) {
            if (! RealEstateHelper::isEnabledProjects()) {
                return null;
            }

            $categoryIds = ShortcodeFacade::fields()->getIds('category_ids', $shortcode);
            $projects = collect();

            if (is_plugin_active('real-estate')) {
                $query = Project::query()
                    ->where([
                            're_projects.is_featured' => true,
                        ] + RealEstateHelper::getProjectDisplayQueryConditions())
                    ->with(RealEstateHelper::getProjectRelationsQuery());

                // Filter by categories if specified
                if (! empty($categoryIds)) {
                    $query->whereHas('categories', function ($q) use ($categoryIds) {
                        $q->whereIn('re_categories.id', $categoryIds);
                    });
                }

                $investorIds = ShortcodeFacade::fields()->getIds('investor_ids', $shortcode);

                if (! empty($investorIds)) {
                    $query->whereHas('investor', function ($q) use ($investorIds) {
                        $q->whereIn('re_investors.id', $investorIds);
                    });
                }

                $projects = $query
                    ->orderBy('re_projects.created_at', 'DESC')
                    ->limit((int) $shortcode->limit ?: (int) theme_option('number_of_featured_projects', 4))
                    ->get();
            }

            if ($projects->isEmpty()) {
                return null;
            }

            return Theme::partial('short-codes.featured-projects', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'projects' => $projects,
            ]);
        });

        if (RealEstateHelper::isEnabledProjects()) {
            shortcode()->setAdminConfig('featured-projects', function (array $attributes) {
                $categories = RealEstateCategory::query()
                    ->wherePublished()
                    ->pluck('name', 'id')
                    ->all();

                $investors = Investor::query()
                    ->wherePublished()
                    ->pluck('name', 'id')
                    ->all();

                return ShortcodeForm::createFromArray($attributes)
                    ->withLazyLoading()
                    ->add('title', 'text', [
                        'label' => __('Title'),
                        'attr' => [
                            'placeholder' => __('Title'),
                        ],
                    ])
                    ->add('subtitle', 'text', [
                        'label' => __('Subtitle'),
                        'attr' => [
                            'placeholder' => __('Subtitle'),
                        ],
                    ])
                    ->add('limit', 'number', [
                        'label' => __('Limit'),
                        'attr' => [
                            'placeholder' => __('Number of projects to display'),
                            'min' => 1,
                        ],
                        'default_value' => (int) theme_option('number_of_featured_projects', 4),
                    ])
                    ->add(
                        'investor_ids[]',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(__('Select investors'))
                            ->choices($investors)
                            ->when(Arr::get($attributes, 'investor_ids'), function (SelectFieldOption $option, $investorIds): void {
                                $option->selected(explode(',', $investorIds));
                            })
                            ->multiple()
                            ->searchable()
                            ->helperText(__('Leave investors empty if you want to show posts from all investors.'))
                    )
                    ->add(
                        'category_ids[]',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(__('Select categories'))
                            ->choices($categories)
                            ->when(Arr::get($attributes, 'category_ids'), function (SelectFieldOption $option, $categoriesIds): void {
                                $option->selected(explode(',', $categoriesIds));
                            })
                            ->multiple()
                            ->searchable()
                            ->helperText(__('Leave categories empty if you want to show projects from all categories.'))
                    );
            });
        }

        ShortcodeFacade::registerLoadingState('featured-projects', Theme::getThemeNamespace('partials.short-codes.skeleton.featured-projects-skeleton'));

        add_shortcode('projects-by-locations', __('Projects by locations'), __('Projects by locations'), function (Shortcode $shortcode) {
            if (! RealEstateHelper::isEnabledProjects() || ! is_plugin_active('location')) {
                return null;
            }

            $cityIds = array_filter(explode(',', $shortcode->city));
            $stateIds = array_filter(explode(',', $shortcode->state));

            if (empty($cityIds) && empty($stateIds)) {
                return null;
            }

            $cities = collect();
            $states = collect();

            if (! empty($cityIds)) {
                $cities = City::query()
                    ->whereIn('id', $cityIds)
                    ->wherePublished()
                    ->select(['id', 'name', 'image', 'slug'])
                    ->orderBy('order')
                    ->orderBy('name')
                    ->get();

                $cities->transform(function (City $city) {
                    $city->setAttribute('url', route('public.projects-by-city', $city->slug));

                    return $city;
                });
            }

            if (! empty($stateIds)) {
                $states = State::query()
                    ->whereIn('id', $stateIds)
                    ->wherePublished()
                    ->select(['id', 'name', 'image', 'slug'])
                    ->orderBy('order')
                    ->orderBy('name')
                    ->get();

                $states->transform(function (State $state) {
                    $state->setAttribute('url', route('public.projects-by-state', $state->slug));

                    return $state;
                });
            }

            $locations = $cities->merge($states);

            if ($locations->isEmpty()) {
                return null;
            }

            return Theme::partial('short-codes.projects-by-locations', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'locations' => $locations,
            ]);
        });

        ShortcodeFacade::registerLoadingState('projects-by-locations', Theme::getThemeNamespace('partials.short-codes.skeleton.locations-skeleton'));

        if (RealEstateHelper::isEnabledProjects()) {
            shortcode()->setAdminConfig('projects-by-locations', function (array $attributes) {
                $cities = City::query()
                    ->wherePublished()
                    ->pluck('name', 'id');

                $states = State::query()
                    ->wherePublished()
                    ->pluck('name', 'id');

                return ShortcodeForm::createFromArray($attributes)
                        ->withLazyLoading()
                        ->add('title', 'text', [
                            'label' => __('Title'),
                            'attr' => [
                                'placeholder' => __('Title'),
                            ],
                        ])
                        ->add('subtitle', 'text', [
                            'label' => __('Subtitle'),
                            'attr' => [
                                'placeholder' => __('Subtitle'),
                            ],
                        ])
                        ->add(
                            'city',
                            SelectField::class,
                            SelectFieldOption::make()
                                ->label(__('Select cities'))
                                ->choices($cities)
                                ->when(Arr::get($attributes, 'city'), function (SelectFieldOption $option, $cityIds): void {
                                    $option->selected(explode(',', $cityIds));
                                })
                                ->multiple()
                                ->searchable()
                        )
                        ->add(
                            'state',
                            SelectField::class,
                            SelectFieldOption::make()
                                ->label(__('Select states'))
                                ->choices($states)
                                ->when(Arr::get($attributes, 'state'), function (SelectFieldOption $option, $stateIds): void {
                                    $option->selected(explode(',', $stateIds));
                                })
                                ->multiple()
                                ->searchable()
                        );
            });
        }

        ShortcodeFacade::registerLoadingState('properties-by-locations', Theme::getThemeNamespace('partials.short-codes.skeleton.locations-skeleton'));

        add_shortcode(
            'properties-by-locations',
            __('Properties by locations'),
            __('Properties by locations'),
            function ($shortcode) {
                if (! is_plugin_active('location')) {
                    return null;
                }

                $cityIds = array_filter(explode(',', (string) $shortcode->city));
                $stateIds = array_filter(explode(',', (string) $shortcode->state));

                if (empty($cityIds) && empty($stateIds)) {
                    return null;
                }

                $cities = collect();
                $states = collect();

                if (! empty($cityIds)) {
                    $cities = City::query()
                        ->whereIn('id', $cityIds)
                        ->wherePublished()
                        ->select(['id', 'name', 'image', 'slug'])
                        ->orderBy('order')
                        ->orderBy('name')
                        ->get();

                    $cities->transform(function (City $city) {
                        $city->setAttribute('url', route('public.properties-by-city', $city->slug));

                        return $city;
                    });
                }

                if (! empty($stateIds)) {
                    $states = State::query()
                        ->whereIn('id', $stateIds)
                        ->wherePublished()
                        ->select(['id', 'name', 'image', 'slug'])
                        ->orderBy('order')
                        ->orderBy('name')
                        ->get();

                    $states->transform(function (State $state) {
                        $state->setAttribute('url', route('public.properties-by-state', $state->slug));

                        return $state;
                    });
                }

                $locations = $cities->merge($states);

                if ($locations->isEmpty()) {
                    return null;
                }

                return Theme::partial('short-codes.properties-by-locations', [
                    'title' => $shortcode->title,
                    'subtitle' => $shortcode->subtitle,
                    'locations' => $locations,
                ]);
            }
        );

        shortcode()->setAdminConfig('properties-by-locations', function (array $attributes) {
            $cities = City::query()
                ->wherePublished()
                ->pluck('name', 'id');

            $states = State::query()
                ->wherePublished()
                ->pluck('name', 'id');

            return ShortcodeForm::createFromArray($attributes)
                    ->withLazyLoading()
                    ->add('title', 'text', [
                        'label' => __('Title'),
                        'attr' => [
                            'placeholder' => __('Title'),
                        ],
                    ])
                    ->add('subtitle', 'text', [
                        'label' => __('Subtitle'),
                        'attr' => [
                            'placeholder' => __('Subtitle'),
                        ],
                    ])
                    ->add(
                        'city',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(__('Select cities'))
                            ->choices($cities)
                            ->when(Arr::get($attributes, 'city'), function (SelectFieldOption $option, $cityIds): void {
                                $option->selected(explode(',', $cityIds));
                            })
                            ->multiple()
                            ->searchable()
                    )
                    ->add(
                        'state',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(__('Select states'))
                            ->choices($states)
                            ->when(Arr::get($attributes, 'state'), function (SelectFieldOption $option, $stateIds): void {
                                $option->selected(explode(',', $stateIds));
                            })
                            ->multiple()
                            ->searchable()
                    );
        });

        add_shortcode('featured-properties', __('Featured properties'), __('Featured properties'), function (Shortcode $shortcode) {
            $categoryIds = ShortcodeFacade::fields()->getIds('category_ids', $shortcode);

            $query = Property::query()
                ->active()
                ->where('is_featured', true)
                ->with(RealEstateHelper::getPropertyRelationsQuery());

            // Filter by categories if specified
            if (! empty($categoryIds)) {
                $query->whereHas('categories', function ($q) use ($categoryIds) {
                    $q->whereIn('re_categories.id', $categoryIds);
                });
            }

            $properties = $query
                ->orderBy('re_properties.created_at', 'DESC')
                ->limit((int) $shortcode->limit ?: 8)
                ->get();

            if ($properties->isEmpty()) {
                return null;
            }

            return Theme::partial('short-codes.featured-properties', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'properties' => $properties,
            ]);
        });

        shortcode()->setAdminConfig('featured-properties', function (array $attributes) {
            $categories = RealEstateCategory::query()
                ->wherePublished()
                ->pluck('name', 'id')
                ->all();

            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add('title', 'text', [
                    'label' => __('Title'),
                    'attr' => [
                        'placeholder' => __('Title'),
                    ],
                ])
                ->add('subtitle', 'text', [
                    'label' => __('Subtitle'),
                    'attr' => [
                        'placeholder' => __('Subtitle'),
                    ],
                ])
                ->add('limit', 'number', [
                    'label' => __('Limit'),
                    'attr' => [
                        'placeholder' => __('Number of properties to display'),
                        'min' => 1,
                    ],
                    'default_value' => 8,
                ])
                ->add(
                    'category_ids[]',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(__('Select categories'))
                        ->choices($categories)
                        ->when(Arr::get($attributes, 'category_ids'), function (SelectFieldOption $option, $categoriesIds): void {
                            $option->selected(explode(',', $categoriesIds));
                        })
                        ->multiple()
                        ->searchable()
                        ->helperText(__('Leave categories empty if you want to show properties from all categories.'))
                );
        });

        ShortcodeFacade::registerLoadingState('featured-properties', Theme::getThemeNamespace('partials.short-codes.skeleton.featured-properties-skeleton'));

        add_shortcode('properties-for-sale', __('Properties for sale'), __('Properties for sale'), function (Shortcode $shortcode) {
            if (! in_array('sale', RealEstateHelper::enabledPropertyTypes())) {
                return null;
            }

            $categoryIds = ShortcodeFacade::fields()->getIds('category_ids', $shortcode);

            $conditions = [
                're_properties.type' => PropertyTypeEnum::SALE,
            ];

            if (($shortcode->featured ?: 1) == 1) {
                $conditions['re_properties.is_featured'] = true;
            }

            $query = Property::query()
                ->active()
                ->where($conditions)
                ->with(RealEstateHelper::getPropertyRelationsQuery());

            // Filter by categories if specified
            if (! empty($categoryIds)) {
                $query->whereHas('categories', function ($q) use ($categoryIds) {
                    $q->whereIn('re_categories.id', $categoryIds);
                });
            }

            $properties = $query
                ->orderBy('re_properties.created_at', 'DESC')
                ->limit((int) $shortcode->limit ?: 8)
                ->get();

            if ($properties->isEmpty()) {
                return null;
            }

            return Theme::partial('short-codes.properties-for-sale', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'properties' => $properties,
            ]);
        });

        if (in_array('sale', RealEstateHelper::enabledPropertyTypes())) {
            shortcode()->setAdminConfig('properties-for-sale', function (array $attributes) {
                $categories = RealEstateCategory::query()
                    ->wherePublished()
                    ->pluck('name', 'id')
                    ->all();

                return ShortcodeForm::createFromArray($attributes)
                    ->withLazyLoading()
                    ->add('title', 'text', [
                        'label' => __('Title'),
                        'attr' => [
                            'placeholder' => __('Title'),
                        ],
                    ])
                    ->add('subtitle', 'text', [
                        'label' => __('Subtitle'),
                        'attr' => [
                            'placeholder' => __('Subtitle'),
                        ],
                    ])
                    ->add('limit', 'number', [
                        'label' => __('Limit'),
                        'attr' => [
                            'placeholder' => __('Number of properties to display'),
                            'min' => 1,
                        ],
                        'default_value' => 8,
                    ])
                    ->add('featured', 'onOff', [
                        'label' => __('Featured only'),
                        'default_value' => true,
                    ])
                    ->add(
                        'category_ids[]',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(__('Select categories'))
                            ->choices($categories)
                            ->when(Arr::get($attributes, 'category_ids'), function (SelectFieldOption $option, $categoriesIds): void {
                                $option->selected(explode(',', $categoriesIds));
                            })
                            ->multiple()
                            ->searchable()
                            ->helperText(__('Leave categories empty if you want to show properties from all categories.'))
                    );
            });
        }

        ShortcodeFacade::registerLoadingState('properties-for-sale', Theme::getThemeNamespace('partials.short-codes.skeleton.featured-properties-skeleton'));

        add_shortcode('properties-for-rent', __('Properties for rent'), __('Properties for rent'), function (Shortcode $shortcode) {
            if (! in_array('rent', RealEstateHelper::enabledPropertyTypes())) {
                return null;
            }

            $categoryIds = ShortcodeFacade::fields()->getIds('category_ids', $shortcode);

            $conditions = [
                're_properties.type' => PropertyTypeEnum::RENT,
            ];

            if (($shortcode->featured ?: 1) == 1) {
                $conditions['re_properties.is_featured'] = true;
            }

            $query = Property::query()
                ->active()
                ->where($conditions)
                ->with(RealEstateHelper::getPropertyRelationsQuery());

            // Filter by categories if specified
            if (! empty($categoryIds)) {
                $query->whereHas('categories', function ($q) use ($categoryIds) {
                    $q->whereIn('re_categories.id', $categoryIds);
                });
            }

            $properties = $query
                ->orderBy('re_properties.created_at', 'DESC')
                ->limit((int) $shortcode->limit ?: 8)
                ->get();

            if ($properties->isEmpty()) {
                return null;
            }

            return Theme::partial('short-codes.properties-for-rent', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'properties' => $properties,
            ]);
        });

        if (in_array('rent', RealEstateHelper::enabledPropertyTypes())) {
            shortcode()->setAdminConfig('properties-for-rent', function (array $attributes) {
                $categories = RealEstateCategory::query()
                    ->wherePublished()
                    ->pluck('name', 'id')
                    ->all();

                return ShortcodeForm::createFromArray($attributes)
                    ->withLazyLoading()
                    ->add('title', 'text', [
                        'label' => __('Title'),
                        'attr' => [
                            'placeholder' => __('Title'),
                        ],
                    ])
                    ->add('subtitle', 'text', [
                        'label' => __('Subtitle'),
                        'attr' => [
                            'placeholder' => __('Subtitle'),
                        ],
                    ])
                    ->add('limit', 'number', [
                        'label' => __('Limit'),
                        'attr' => [
                            'placeholder' => __('Number of properties to display'),
                            'min' => 1,
                        ],
                        'default_value' => 8,
                    ])
                    ->add('featured', 'onOff', [
                        'label' => __('Featured only'),
                        'default_value' => true,
                    ])
                    ->add(
                        'category_ids[]',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(__('Select categories'))
                            ->choices($categories)
                            ->when(Arr::get($attributes, 'category_ids'), function (SelectFieldOption $option, $categoriesIds): void {
                                $option->selected(explode(',', $categoriesIds));
                            })
                            ->multiple()
                            ->searchable()
                            ->helperText(__('Leave categories empty if you want to show properties from all categories.'))
                    );
            });
        }

        ShortcodeFacade::registerLoadingState('properties-for-rent', Theme::getThemeNamespace('partials.short-codes.skeleton.featured-properties-skeleton'));

        add_shortcode(
            'recently-viewed-properties',
            __('Recent Viewed Properties'),
            __('Recently Viewed Properties'),
            function ($shortcode) {
                $cookieName = App::getLocale() . '_recently_viewed_properties';
                $jsonRecentViewProduct = null;

                if (isset($_COOKIE[$cookieName])) {
                    $jsonRecentViewProduct = $_COOKIE[$cookieName];
                }

                if (empty($jsonRecentViewProduct)) {
                    return null;
                }

                $ids = collect(json_decode($jsonRecentViewProduct, true))->flatten()->all();

                $properties = Property::query()
                    ->active()
                    ->whereIn('id', $ids)
                    ->with(RealEstateHelper::getPropertyRelationsQuery())
                    ->orderBy('re_properties.created_at', 'DESC')
                    ->limit((int) $shortcode->limit ?: 8)
                    ->get();

                if ($properties->isEmpty()) {
                    return null;
                }

                $reversed = array_reverse($ids);

                $properties = $properties->sortBy(function ($model) use ($reversed) {
                    return array_search($model->id, $reversed);
                });

                return Theme::partial('short-codes.recently-viewed-properties', [
                    'title' => $shortcode->title,
                    'description' => $shortcode->description,
                    'subtitle' => $shortcode->subtitle,
                    'properties' => $properties,
                ]);
            }
        );

        shortcode()->setAdminConfig('recently-viewed-properties', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add('title', 'text', [
                    'label' => __('Title'),
                    'attr' => [
                        'placeholder' => __('Title'),
                    ],
                ])
                ->add('description', 'textarea', [
                    'label' => __('Description'),
                    'attr' => [
                        'placeholder' => __('Description'),
                        'rows' => 3,
                    ],
                ])
                ->add('subtitle', 'textarea', [
                    'label' => __('Subtitle'),
                    'attr' => [
                        'placeholder' => __('Subtitle'),
                        'rows' => 3,
                    ],
                ])
                ->add('limit', 'number', [
                    'label' => __('Limit'),
                    'attr' => [
                        'placeholder' => __('Number of properties to display'),
                        'min' => 1,
                    ],
                    'default_value' => 8,
                ]);
        });

        ShortcodeFacade::registerLoadingState('recently-viewed-properties', Theme::getThemeNamespace('partials.short-codes.skeleton.featured-properties-skeleton'));

        add_shortcode(
            'featured-agents',
            __('Featured Agents'),
            __('Featured Agents'),
            function (Shortcode $shortcode) {
                $agents = Account::query()
                    ->where('is_featured', true)
                    ->orderByDesc('id')
                    ->take((int) $shortcode->limit ?: 4)
                    ->withCount([
                        'properties' => function ($query) {
                            return RepositoryHelper::applyBeforeExecuteQuery($query, $query->getModel());
                        },
                    ])
                    ->with(['avatar'])
                    ->get();

                if ($agents->isEmpty()) {
                    return null;
                }

                return Theme::partial('short-codes.featured-agents', [
                    'title' => $shortcode->title,
                    'description' => $shortcode->description,
                    'subtitle' => $shortcode->subtitle,
                    'agents' => $agents,
                ]);
            }
        );

        shortcode()->setAdminConfig('featured-agents', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add('title', 'text', [
                    'label' => __('Title'),
                    'attr' => [
                        'placeholder' => __('Title'),
                    ],
                ])
                ->add('description', 'textarea', [
                    'label' => __('Description'),
                    'attr' => [
                        'placeholder' => __('Description'),
                        'rows' => 3,
                    ],
                ])
                ->add('subtitle', 'textarea', [
                    'label' => __('Subtitle'),
                    'attr' => [
                        'placeholder' => __('Subtitle'),
                        'rows' => 3,
                    ],
                ])
                ->add('limit', 'number', [
                    'label' => __('Limit'),
                    'attr' => [
                        'placeholder' => __('Number of agents to display'),
                        'min' => 1,
                    ],
                    'default_value' => 4,
                ]);
        });

        ShortcodeFacade::registerLoadingState('featured-agents', Theme::getThemeNamespace('partials.short-codes.skeleton.featured-agents-skeleton'));

        add_shortcode(
            'search-box',
            __('Search box'),
            __('Search box'),
            function (Shortcode $shortcode) {
                return Theme::partial('short-codes.search-box', compact('shortcode'));
            }
        );

        shortcode()->setAdminConfig('search-box', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add('title', 'text', [
                    'label' => __('Title'),
                    'attr' => [
                        'placeholder' => __('Title'),
                    ],
                ])
                ->add(
                    'background_image',
                    MediaImageField::class,
                    MediaImageFieldOption::make()
                        ->label(__('Background Image'))
                )
                ->add(
                    'enable_search_projects_on_homepage_search',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(__('Enable search projects on homepage search box?'))
                        ->choices([
                            'yes' => trans('core/base::base.yes'),
                            'no' => trans('core/base::base.no'),
                        ])
                        ->selected(Arr::get($attributes, 'enable_search_projects_on_homepage_search', 'yes'))
                )
                ->add(
                    'default_home_search_type',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(__('Default search type on homepage search box?'))
                        ->choices([
                            'project' => __('Projects'),
                            'sale' => __('Properties for sale'),
                            'rent' => __('Properties for rent'),
                        ])
                        ->selected(Arr::get($attributes, 'default_home_search_type', 'project'))
                )
                ->add(
                    'enable_change_image_background',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(__('Enable change image background?'))
                        ->choices([
                            'no' => trans('core/base::base.no'),
                            'yes' => trans('core/base::base.yes'),
                        ])
                        ->selected(Arr::get($attributes, 'enable_change_image_background', 'no'))
                )
                ->add('seconds', 'number', [
                    'label' => __('Change image after (second)'),
                    'attr' => [
                        'placeholder' => __('Change image after (second)'),
                    ],
                    'default_value' => 5,
                ])
                ->add(
                    'images',
                    ShortcodeTabsField::class,
                    ShortcodeTabsFieldOption::make()
                        ->label(__('Images'))
                        ->fields([
                            'image' => [
                                'type' => 'mediaImage',
                                'label' => __('Image'),
                                'attributes' => [
                                    'name' => 'image',
                                    'value' => null,
                                ],
                            ],
                        ])
                        ->attrs($attributes)
                        ->max(20)
                );
        });

        ShortcodeFacade::registerLoadingState('search-box', Theme::getThemeNamespace('partials.short-codes.skeleton.search-box-skeleton'));

        add_shortcode('properties-list', __('Properties List'), __('Properties List'), function (Shortcode $shortcode) {
            $properties = RealEstateHelper::getPropertiesFilter((int) $shortcode->per_page ?: 12);

            $keyword = BaseHelper::stringify(request()->input('k'));

            if (! empty($keyword)) {
                SeoHelper::setTitle(__('Search results for ":keyword"', ['keyword' => $keyword]));
            }

            return Theme::partial('short-codes.properties-list', [
                'title' => $shortcode->title,
                'description' => $shortcode->description,
                'properties' => $properties,
            ]);
        });

        shortcode()->setAdminConfig('properties-list', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add('title', 'text', [
                    'label' => __('Title'),
                    'attr' => [
                        'placeholder' => __('Title'),
                    ],
                ])
                ->add('description', 'textarea', [
                    'label' => __('Description'),
                    'attr' => [
                        'placeholder' => __('Description'),
                        'rows' => 3,
                    ],
                ])
                ->add(
                    'per_page',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(__('Number of properties per page'))
                        ->choices(RealEstateHelper::getPropertiesPerPageList())
                        ->selected(Arr::get($attributes, 'per_page', 12))
                );
        });

        ShortcodeFacade::registerLoadingState('properties-list', Theme::getThemeNamespace('partials.short-codes.skeleton.properties-list-skeleton'));

        add_shortcode('projects-list', __('Projects List'), __('Projects List'), function (Shortcode $shortcode) {
            $projects = RealEstateHelper::getProjectsFilter((int) $shortcode->per_page ?: 12);

            $keyword = BaseHelper::stringify(request()->input('k'));

            if (! empty($keyword)) {
                SeoHelper::setTitle(__('Search results for ":keyword"', ['keyword' => $keyword]));
            }

            return Theme::partial('short-codes.projects-list', [
                'title' => $shortcode->title,
                'description' => $shortcode->description,
                'projects' => $projects,
            ]);
        });

        shortcode()->setAdminConfig('projects-list', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add('title', 'text', [
                    'label' => __('Title'),
                    'attr' => [
                        'placeholder' => __('Title'),
                    ],
                ])
                ->add('description', 'textarea', [
                    'label' => __('Description'),
                    'attr' => [
                        'placeholder' => __('Description'),
                        'rows' => 3,
                    ],
                ])
                ->add(
                    'per_page',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(__('Number of projects per page'))
                        ->choices(RealEstateHelper::getProjectsPerPageList())
                        ->selected(Arr::get($attributes, 'per_page', 12))
                );
        });

        ShortcodeFacade::registerLoadingState('projects-list', Theme::getThemeNamespace('partials.short-codes.skeleton.projects-list-skeleton'));
    }

    if (is_plugin_active('blog')) {
        add_shortcode('latest-news', __('Latest news'), __('Latest news'), function (Shortcode $shortcode) {
            $categoryIds = ShortcodeFacade::fields()->getIds('category_ids', $shortcode);

            $posts = Post::query()
                ->wherePublished()
                ->where('is_featured', true)
                ->with(['slugable', 'categories', 'categories.slugable'])
                ->when($categoryIds, function ($query) use ($categoryIds) {
                    return $query->whereHas('categories', function ($query) use ($categoryIds) {
                        $query->whereIn('categories.id', $categoryIds);
                    });
                })
                ->orderByDesc('created_at')
                ->take((int) $shortcode->limit ?: 4)
                ->get();

            if ($posts->isEmpty()) {
                return null;
            }

            return Theme::partial('short-codes.latest-news', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'posts' => $posts,
            ]);
        });

        shortcode()->setAdminConfig('latest-news', function (array $attributes) {
            $categories = Category::query()
                ->wherePublished()
                ->pluck('name', 'id')
                ->all();

            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add('title', 'text', [
                    'label' => __('Title'),
                    'attr' => [
                        'placeholder' => __('Title'),
                    ],
                ])
                ->add('subtitle', 'textarea', [
                    'label' => __('Subtitle'),
                    'attr' => [
                        'placeholder' => __('Subtitle'),
                        'rows' => 3,
                    ],
                ])
                ->add('limit', 'number', [
                    'label' => __('Limit'),
                    'attr' => [
                        'placeholder' => __('Number of posts to display'),
                        'min' => 1,
                    ],
                    'default_value' => 4,
                ])
                ->add(
                    'category_ids[]',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(__('Select categories'))
                        ->choices($categories)
                        ->when(Arr::get($attributes, 'category_ids'), function (SelectFieldOption $option, $categoriesIds): void {
                            $option->selected(explode(',', $categoriesIds));
                        })
                        ->multiple()
                        ->searchable()
                        ->helperText(__('Leave categories empty if you want to show posts from all categories.'))
                );
        });

        ShortcodeFacade::registerLoadingState('latest-news', Theme::getThemeNamespace('partials.short-codes.skeleton.latest-news-skeleton'));
    }

    if (is_plugin_active('contact')) {

        add_filter(CONTACT_FORM_TEMPLATE_VIEW, function () {
            return Theme::getThemeNamespace() . '::partials.short-codes.contact-form';
        }, 120);
    }

    if (is_plugin_active('real-estate')) {
        add_shortcode('pricing-plan', __('Pricing Plan'), __('Display pricing packages for properties'), function (Shortcode $shortcode) {
            $packageIds = ShortcodeFacade::fields()->getIds('package_ids', $shortcode);

            if (empty($packageIds)) {
                return null;
            }

            $packages = Package::query()
                ->wherePublished()
                ->whereIn('id', $packageIds)
                ->get();

            if ($packages->isEmpty()) {
                return null;
            }

            return Theme::partial('short-codes.pricing-plan', compact('shortcode', 'packages'));
        });

        shortcode()->setAdminConfig('pricing-plan', function (array $attributes) {
            $packages = Package::query()
                ->wherePublished()
                ->pluck('name', 'id')
                ->all();

            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add('title', 'text', [
                    'label' => __('Title'),
                    'attr' => [
                        'placeholder' => __('Enter heading title'),
                    ],
                ])
                ->add('subtitle', 'textarea', [
                    'label' => __('Subtitle'),
                    'attr' => [
                        'placeholder' => __('Enter subtitle'),
                        'rows' => 3,
                    ],
                ])
                ->add(
                    'package_ids[]',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(__('Select Packages'))
                        ->choices($packages)
                        ->when(Arr::get($attributes, 'package_ids'), function (SelectFieldOption $option, $packageIds): void {
                            $option->selected(explode(',', $packageIds));
                        })
                        ->multiple()
                        ->searchable()
                        ->helperText(__('Choose which pricing packages to display'))
                );
        });
    }
});
