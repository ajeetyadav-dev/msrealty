@php
    $isAjaxRequest = request()->ajax() || request()->expectsJson();

    if (theme_option('show_map_on_properties_page', 'yes') == 'yes' && !$isAjaxRequest) {
        Theme::asset()
            ->usePath()
            ->add('leaflet-css', 'libraries/leaflet/leaflet.css');
        Theme::asset()
            ->usePath()
            ->add('leaflet-markercluster-css', 'libraries/leaflet/MarkerCluster.css');
        Theme::asset()
            ->usePath()
            ->add('leaflet-markercluster-default-css', 'libraries/leaflet/MarkerCluster.Default.css');
        Theme::asset()
            ->container('footer')
            ->usePath()
            ->add('leaflet-js', 'libraries/leaflet/leaflet.js');
        Theme::asset()
            ->container('footer')
            ->usePath()
            ->add('leaflet.markercluster-src-js', 'libraries/leaflet/leaflet.markercluster-src.js');
    }

    $categories = get_property_categories_for_select();
@endphp

<section class="main-homes pb-3">
    <div
        class="bgheadproject hidden-xs"
        style="background: url('{{ theme_option('breadcrumb_background') ? RvMedia::url(theme_option('breadcrumb_background')) : Theme::asset()->url('images/banner-du-an.jpg') }}')"
    >
        <div class="description">
            <div class="container-fluid w90">
                <h1 class="text-center">{{ $title ?? __('Discover our properties') }}</h1>
                <p class="text-center">{{ $description ?? theme_option('properties_description') }}</p>
                {!! Theme::partial('breadcrumb') !!}
            </div>
        </div>
    </div>
    <div class="container-fluid w90 padtop30">
        <div class="projecthome">
            <form
                id="ajax-filters-form"
                data-ajax-url="{{ $ajaxUrl ?? route('public.properties') }}"
                action="{{ $actionUrl ?? RealEstateHelper::getPropertiesListPageUrl() }}"
                method="get"
            >
                {!! apply_filters(
                    'properties_projects_detail_search_box',
                    view(Theme::getThemeNamespace() . '::views.real-estate.includes.search-box', [
                        'type' => 'property',
                        'categories' => $categories,
                    ])->render(),
                    ['type' => 'property', 'categories' => $categories],
                ) !!}
                {!! apply_filters('ads_render', null, 'property_list_before') !!}

                <div class="row rowm10">
                    <div
                        class="@if (theme_option('show_map_on_properties_page', 'yes') == 'yes' && Arr::get($_COOKIE, 'show_map_on_properties', 1)) col-lg-7 left-page-content @else col-lg-12 full-page-content @endif"
                        id="properties-list"
                        @if (theme_option('show_map_on_properties_page', 'yes') == 'yes') data-class-full="col-lg-12 full-page-content"
                         data-class-left="col-lg-7 left-page-content" @endif
                    >
                        @include(Theme::getThemeNamespace() . '::views.real-estate.includes.filters', [
                            'isChangeView' => theme_option('show_map_on_properties_page', 'yes') == 'yes',
                        ])
                        <div class="data-listing mt-2">
                            {!! Theme::partial('real-estate.properties.items', compact('properties')) !!}
                        </div>
                    </div>
                    @if (theme_option('show_map_on_properties_page', 'yes') == 'yes')
                        <div
                            class="col-md-5 @if (!Arr::get($_COOKIE, 'show_map_on_properties', 1)) d-none @endif"
                            id="properties-map"
                        >
                            <div class="rightmap h-100">
                                <div
                                    id="map"
                                    data-tile-layer="{{ RealEstateHelper::getMapTileLayer() }}"
                                    data-type="{{ request()->input('type') }}"
                                    data-url="{{ route('public.ajax.properties.map') }}{{ isset($city) && $city ? '?city_id=' . $city->id : '' }}"
                                    data-center="{{ json_encode(RealEstateHelper::getMapCenterLatLng()) }}"
                                    data-max-zoom="18"
                                ></div>
                            </div>
                        </div>
                    @endif
                </div>

                {!! apply_filters('ads_render', null, 'property_list_after') !!}
            </form>
        </div>
    </div>
</section>

@if (theme_option('show_map_on_properties_page', 'yes') == 'yes')
    <script id="traffic-popup-map-template" type="text/x-custom-template">
        {!! Theme::partial('real-estate.properties.map', ['property' => get_object_property_map()]) !!}
    </script>

    @if ($isAjaxRequest)
        <script>
            (function() {
                // Check if Leaflet is already loaded
                if (typeof L !== 'undefined') {
                    document.dispatchEvent(new CustomEvent('leaflet.loaded'));
                    return;
                }

                // Load CSS files
                const cssFiles = [
                    '{{ Theme::asset()->url('libraries/leaflet/leaflet.css') }}',
                    '{{ Theme::asset()->url('libraries/leaflet/MarkerCluster.css') }}',
                    '{{ Theme::asset()->url('libraries/leaflet/MarkerCluster.Default.css') }}'
                ];

                cssFiles.forEach(function(href) {
                    if (!document.querySelector('link[href="' + href + '"]')) {
                        const link = document.createElement('link');
                        link.rel = 'stylesheet';
                        link.href = href;
                        document.head.appendChild(link);
                    }
                });

                // Load JS files sequentially
                function loadScript(src, callback) {
                    if (document.querySelector('script[src="' + src + '"]')) {
                        if (callback) callback();
                        return;
                    }
                    const script = document.createElement('script');
                    script.src = src;
                    script.onload = function() {
                        if (callback) callback();
                    };
                    script.onerror = function() {
                        console.error('Failed to load Leaflet script:', src);
                    };
                    document.body.appendChild(script);
                }

                loadScript('{{ Theme::asset()->url('libraries/leaflet/leaflet.js') }}', function() {
                    loadScript('{{ Theme::asset()->url('libraries/leaflet/leaflet.markercluster-src.js') }}', function() {
                        document.dispatchEvent(new CustomEvent('leaflet.loaded'));
                    });
                });
            })();
        </script>
   @endif
@endif
