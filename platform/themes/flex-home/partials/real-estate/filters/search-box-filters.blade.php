@if(theme_option('real_estate_enable_advanced_search', 'yes') == 'yes')
<div class="advanced-search">
    <a href="#" class="advanced-search-toggler">{{ __('Advanced') }} <i class="fas fa-caret-down"></i></a>
    <div class="advanced-search-content property-advanced-search">
        <div class="form-group">
            <div class="row">
                @if(RealEstateHelper::isEnabledProjects() && theme_option('real_estate_enable_filter_by_project', 'yes') == 'yes')
                    <div class="col-sm-3 px-md-1">
                        {!! Theme::partial('real-estate.filters.by-project') !!}
                    </div>
                @endif
                <div @class(['px-md-1', 'col-sm-3' => RealEstateHelper::isEnabledProjects() && theme_option('real_estate_enable_filter_by_project', 'yes') == 'yes', 'col-sm-6' => ! (RealEstateHelper::isEnabledProjects() && theme_option('real_estate_enable_filter_by_project', 'yes') == 'yes')])>
                    {!! Theme::partial('real-estate.filters.categories', compact('categories')) !!}
                </div>
                @if(theme_option('real_estate_enable_filter_by_price', 'yes') == 'yes')
                    {!! Theme::partial('real-estate.filters.price') !!}
                @endif
            </div>

            <div class="row">
                @if(theme_option('real_estate_enable_filter_by_bedroom', 'yes') == 'yes')
                    <div class="col-md-4 col-sm-6 px-md-1">
                        {!! Theme::partial('real-estate.filters.bedroom') !!}
                    </div>
                @endif
                @if(theme_option('real_estate_enable_filter_by_bathroom', 'yes') == 'yes')
                    <div class="col-md-4 col-sm-6 px-md-1">
                        {!! Theme::partial('real-estate.filters.bathroom') !!}
                    </div>
                @endif
                @if(theme_option('real_estate_enable_filter_by_floor', 'yes') == 'yes')
                    <div class="col-md-4 col-sm-6 px-md-1">
                        {!! Theme::partial('real-estate.filters.floor') !!}
                    </div>
                @endif
            </div>
        </div>
    </div>

    @if ($enableProjectsSearch)
        <div class="advanced-search-content project-advanced-search">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        {!! Theme::partial('real-estate.filters.categories', compact('categories')) !!}
                    </div>
                    @if(theme_option('real_estate_enable_filter_by_price', 'yes') == 'yes')
                        {!! Theme::partial('real-estate.filters.price') !!}
                    @endif
                </div>
            </div>
        </div>
    @endif
</div>
@endif
