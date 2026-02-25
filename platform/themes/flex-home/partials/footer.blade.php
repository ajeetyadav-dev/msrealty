<footer>
    <br>
    <div class="container-fluid w90">
        <div class="row">
            <div class="col-sm-3">
                @if ($logo = (theme_option('footer_logo') ?: theme_option('logo')))
                    <p>
                        <a href="{{ BaseHelper::getHomepageUrl() }}">
                            <img src="{{ RvMedia::getImageUrl($logo)  }}" style="max-height: 38px" alt="{{ Theme::getSiteTitle() }}">
                        </a>
                    </p>
                @endif
                @if ($address = theme_option('address'))
                    <p><i class="fas fa-map-marker-alt"></i> &nbsp;{{ $address }}</p>
                @endif
                @if ($hotline = theme_option('hotline'))
                    <p><i class="fas fa-phone-square"></i>&nbsp;<span class="d-inline-block">{{ __('Hotline') }}: </span>&nbsp;<a href="tel:{{ $hotline }}" dir="ltr">{{ $hotline }}</a></p>
                @endif
                @if ($email = theme_option('email'))
                    <p><i class="fas fa-envelope"></i>&nbsp;<span class="d-inline-block">{{ __('Email') }}: </span>&nbsp;<a href="mailto:{{ $email }}" dir="ltr">{{ $email }}</a></p>
                @endif

                @if ($socialLinks = json_decode(theme_option('social_links'), true))
                    <div class="top-socials footer-socials">
                        @foreach($socialLinks as $socialLink)
                            @if (count($socialLink) == 3 && isset($socialLink[1]['value']) && isset($socialLink[2]['value']))
                                @php $hasSocialLinks = true; @endphp
                                <a href="{{ $socialLink[2]['value'] }}"
                                   title="{{ $socialLink[0]['value'] }}" target="_blank">
                                    <i class="{{ $socialLink[1]['value'] }}"></i>
                                </a>
                            @endif
                        @endforeach
                    </div>
                @endif
            </div>
            <div class="col-sm-9 padtop10">
                <div class="row">
                    {!! dynamic_sidebar('footer_sidebar') !!}
                </div>
            </div>
        </div>
        @if ($languageSwitcher = Theme::partial('language-switcher'))
            <div class="row">
                <div class="col-12">
                    {!! $languageSwitcher !!}
                </div>
            </div>
        @endif
        @if ($copyright = Theme::getSiteCopyright())
            <div class="copyright">
                <div class="col-sm-12">
                    <p class="text-center mb-0">
                        {!! $copyright !!}
                    </p>
                </div>
            </div>
        @endif
    </div>
</footer>

<script>
    window.trans = {
        "Price": "{{ __('Price') }}",
        "Number of rooms": "{{ __('Number of rooms') }}",
        "Number of rest rooms": "{{ __('Number of rest rooms') }}",
        "Square": "{{ __('Square') }}",
        "million": "{{ __('million') }}",
        "billion": "{{ __('billion') }}",
        "in": "{{ __('in') }}",
        "Added to wishlist successfully!": "{{ __('Added to wishlist successfully!') }}",
        "Removed from wishlist successfully!": "{{ __('Removed from wishlist successfully!') }}",
        "I care about this property!!!": "{{ __('I care about this property!!!') }}",
    };
    window.themeUrl = '{{ Theme::asset()->url('') }}';
    window.siteUrl = '{{ route('public.index') }}';
    window.currentLanguage = '{{ App::getLocale() }}';
</script>

<div class="action_footer">
    <a href="#" @class(['cd-top', 'cd-top-40' => !Theme::get('hotlineNumber') && ! $hotline]) title="back to top"><i class="fas fa-arrow-up"></i></a>
    @if (Theme::get('hotlineNumber') || $hotline)
        <a href="tel:{{ Theme::get('hotlineNumber') ?: $hotline }}" class="text-white" style="font-size: 17px;"><i class="fas fa-phone"></i> <span>  &nbsp;{{ Theme::get('hotlineNumber') ?: $hotline }}</span></a>
    @endif
</div>
