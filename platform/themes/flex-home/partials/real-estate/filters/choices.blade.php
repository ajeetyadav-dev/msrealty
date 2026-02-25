<label for="select-type" class="control-label">{{ __('Choices') }}</label>
<div class="dropdown mb-2 select-dropdown" data-text-default="{{ $labelDefault }}">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuChoise" data-toggle="dropdown"
        aria-haspopup="true" aria-expanded="false">
        <span>{{ $labelDefault }}</span>
    </button>
    <div class="dropdown-menu keep-open" style="min-width: 20em" aria-labelledby="dropdownMenuChoise">
        @if ($type == 'property')
            <div class="dropdown-item">
                <div class="row">
                    @if (count(RealEstateHelper::enabledPropertyTypes()) > 1)
                        <div class="col-6 pr-1">
                            {!! Theme::partial('real-estate.filters.type') !!}
                        </div>
                    @endif
                    <div @class(['col-6 pl-1' => count(RealEstateHelper::enabledPropertyTypes()) > 1, 'col-12' => count(RealEstateHelper::enabledPropertyTypes()) <= 1])>
                        {!! Theme::partial('real-estate.filters.categories', ['categories' => $categories]) !!}
                    </div>
                </div>
            </div>

            @if (RealEstateHelper::isEnabledProjects() && theme_option('real_estate_enable_filter_by_project', 'yes') == 'yes')
                <div class="dropdown-item">
                    <div class="row">
                        <div class="col-12">
                            {!! Theme::partial('real-estate.filters.by-project') !!}
                        </div>
                    </div>
                </div>
            @endif

            @if(theme_option('real_estate_enable_filter_by_bedroom', 'yes') == 'yes' || theme_option('real_estate_enable_filter_by_bathroom', 'yes') == 'yes')
            <div class="dropdown-item">
                <div class="row">
                    @if(theme_option('real_estate_enable_filter_by_bedroom', 'yes') == 'yes')
                    <div @class(['col-6 pr-1' => theme_option('real_estate_enable_filter_by_bathroom', 'yes') == 'yes', 'col-12' => theme_option('real_estate_enable_filter_by_bathroom', 'yes') != 'yes'])>
                        {!! Theme::partial('real-estate.filters.bedroom') !!}
                    </div>
                    @endif
                    @if(theme_option('real_estate_enable_filter_by_bathroom', 'yes') == 'yes')
                    <div @class(['col-6 pl-1' => theme_option('real_estate_enable_filter_by_bedroom', 'yes') == 'yes', 'col-12' => theme_option('real_estate_enable_filter_by_bedroom', 'yes') != 'yes'])>
                        {!! Theme::partial('real-estate.filters.bathroom') !!}
                    </div>
                    @endif
                </div>
            </div>
            @endif
            @if(theme_option('real_estate_enable_filter_by_floor', 'yes') == 'yes')
            <div class="dropdown-item">
                <div class="row">
                    <div class="col-6 pr-1">
                        {!! Theme::partial('real-estate.filters.floor') !!}
                    </div>
                </div>
            </div>
            @endif

            {!! $extraChoices ?? null !!}

            <div class="dropdown-item">
                <div class='form-group'>
                    <button class="btn btn-primary">{{ __('OK') }}</button>
                    <button type="button" class="btn btn-primary bg-secondary float-right btn-clear">{{ __('Clear') }}</button>
                </div>
            </div>
        @else
            <div class="dropdown-item">
                {!! Theme::partial('real-estate.filters.categories', ['categories' => $categories]) !!}
            </div>
            @if(theme_option('real_estate_enable_filter_by_block', 'yes') == 'yes')
            <div class="dropdown-item">
                {!! Theme::partial('real-estate.filters.block') !!}
            </div>
            @endif
            <div class="dropdown-item">
                <div class="form-group">
                    <div class="col-xs-auto">
                        <button class="btn btn-primary">{{ __('OK') }}</button>
                        <button type="button" class="btn btn-primary bg-secondary float-right btn-clear">{{ __('Clear') }}</button>
                    </div>
                </div>
            </div>
        @endif
    </div>
</div>
