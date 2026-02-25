@if ($images = (array)$object->images)
    @php
        $showGalleryButton = theme_option('show_gallery_button', 'yes') === 'yes' && count($images) > 1;
        $showMapButton = $object->latitude && $object->longitude && theme_option('real_estate_show_map_on_single_detail_page', 'yes') === 'yes' && theme_option('show_map_button', 'yes') === 'yes';

        $smallItems = theme_option('property_thumb_slider_items_small', 2);
        $mediumItems = theme_option('property_thumb_slider_items_medium', 3);
        $largeItems = theme_option('property_thumb_slider_items_large', 5);
    @endphp
    <div class="boxsliderdetail">
        @if(count($images) > 1)
            <div class="slidetop">
                <div class="owl-carousel" id="listcarousel"
                    data-items-small="{{ theme_option('property_main_slider_items_small', 1) }}"
                    data-items-medium="{{ theme_option('property_main_slider_items_medium', 2) }}"
                    data-items-large="{{ theme_option('property_main_slider_items_large', 3) }}">
                    @foreach ($images as $image)
                        <div class="item">
                            <img src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}"
                                class="showfullimg"
                                rel="{{ $loop->index }}"
                                alt="{{ $object->name }}"
                                title="{{ $object->name }}"
                                data-mfp-src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}">
                        </div>
                    @endforeach
                </div>
            </div>
            @else
                <div class="featured-image">
                    @php
                        $image = Arr::first($images);
                    @endphp

                    <img src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}"
                         class="showfullimg"
                         rel="0"
                         alt="{{ $object->name }}"
                         title="{{ $object->name }}"
                         data-mfp-src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}">
                </div>
            @endif
        <div class="slidebot">
            <div class="row">
                <div class="{{ !$showGalleryButton && !$showMapButton ? 'col-12 col-md-12' : (!$showGalleryButton || !$showMapButton ? 'col-9 col-md-9' : 'col-6 col-md-7') }} col-sm-6">
                    <div>

                        <div class="owl-carousel" id="listcarouselthumb"
                            data-items-small="{{ $smallItems }}"
                            data-items-medium="{{ $mediumItems }}"
                            data-items-large="{{ $largeItems }}">
                            @foreach($images as $image)
                                <div class="item cthumb" rel="{{ $loop->index }}">
                                    <img src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}"
                                        class="showfullimg-thumb"
                                        rel="{{ $loop->index }}"
                                        alt="{{ $object->name }}"
                                        data-mfp-src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}"
                                        title="{{ $object->name }}">
                                </div>
                            @endforeach
                        </div>
                        <i class="fas fa-chevron-right ar-next"></i>
                        <i class="fas fa-chevron-left ar-prev"></i>
                    </div>
                </div>
                <div class="{{ !$showGalleryButton && !$showMapButton ? 'd-none' : (!$showGalleryButton || !$showMapButton ? 'col-3 col-md-3' : 'col-6 col-md-5') }} col-sm-6" style="align-self: center">
                    <div class="row control justify-content-sm-end justify-content-center">
                        @if ($object->video_url)
                            <div class="col-6 col-sm-4 col-md-4 col-lg-2 itemct px-1 popup-youtube" href="{{ Botble\Theme\Supports\Youtube::getYoutubeVideoEmbedURL($object->video_url) }}">
                                <div class="icon">
                                    <i class="fab fa-youtube"></i>
                                    <p>{{ __('YouTube') }}</p>
                                </div>
                            </div>
                        @endif

                        @if ($showGalleryButton)
                            <div class="col-sm-4 col-md-4 col-lg-2 itemct d-none d-sm-block px-1 show-gallery-image">
                                <div class="icon">
                                    <i class="fas fa-th"></i>
                                    <p>{{ __('Gallery') }}</p>
                                </div>
                            </div>
                        @endif

                        @if ($showMapButton)
                            <div class="col-6 col-sm-4 col-md-4 col-lg-2 itemct px-1"
                                data-magnific-popup="#trafficMap"
                                data-map-id="trafficMap"
                                data-tile-layer="{{ RealEstateHelper::getMapTileLayer() }}"
                                data-popup-id="#traffic-popup-map-template"
                                data-map-icon="{{ $object->map_icon }}"
                                data-center="{{ json_encode([$object->latitude, $object->longitude]) }}">
                                <div class="icon">
                                    <i class="far fa-map"></i>
                                    <p>{{ __('Map') }}</p>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@else
    @if ($object->latitude && $object->longitude)
        <div class="d-none"
             data-magnific-popup="#trafficMap"
             data-map-id="trafficMap"
             data-tile-layer="{{ RealEstateHelper::getMapTileLayer() }}"
             data-popup-id="#traffic-popup-map-template"
             data-map-icon="{{ $object->map_icon }}"
             data-center="{{ json_encode([$object->latitude, $object->longitude]) }}">
        </div>
    @endif
@endif
