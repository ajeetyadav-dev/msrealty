<section class="faq-section">
    @if($shortcode->title || $shortcode->subtitle)
        <div class="faq-header">
            <div class="faq-header-content">
                @if ($title = $shortcode->title)
                    <h2 class="faq-title">{!! BaseHelper::clean($title) !!}</h2>
                @endif
                @if ($subtitle = $shortcode->subtitle)
                    <p class="faq-subtitle">{!! BaseHelper::clean($subtitle) !!}</p>
                @endif
            </div>
        </div>
    @endif

    <div class="faq-content">
        <div class="faq-container">
            @switch($shortcode->display_type)
                @case('list')
                    <div class="faq-wrapper">
                        <div class="faq-list" id="faq-list">
                            @foreach($faqs as $faq)
                                @php
                                    $isExpanded = $loop->first && $shortcode->expand_first_time;
                                @endphp
                                <div class="faq-item">
                                    <div class="faq-question-wrapper">
                                        <button class="faq-question @if(!$isExpanded) collapsed @endif"
                                                type="button"
                                                data-target="#faq-answer-{{ $faq->getKey() }}"
                                                aria-expanded="{{ $isExpanded ? 'true' : 'false' }}"
                                                aria-controls="faq-answer-{{ $faq->getKey() }}">
                                            <span class="faq-question-text">{!! BaseHelper::clean($faq->question) !!}</span>
                                            <span class="faq-icon">
                                                <span class="faq-icon-plus">+</span>
                                                <span class="faq-icon-minus">−</span>
                                            </span>
                                        </button>
                                    </div>
                                    <div id="faq-answer-{{ $faq->getKey() }}"
                                         class="faq-answer @if($isExpanded) show @endif">
                                        <div class="faq-answer-content">
                                            {!! BaseHelper::clean($faq->answer) !!}
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>

                    @break

                @default
                    @foreach($categories as $category)
                        <div class="faq-category">
                            @if ($categories->count() > 1)
                                <h3 class="faq-category-title">{{ $category->name }}</h3>
                            @endif
                            <div class="faq-wrapper">
                                <div class="faq-list" id="faq-list-{{ $categorySlug = Str::slug($category->name) }}">
                                    @foreach($category->faqs as $faq)
                                        <div class="faq-item">
                                            <div class="faq-question-wrapper">
                                                <button class="faq-question collapsed"
                                                        type="button"
                                                        data-target="#faq-answer-{{ $categorySlug }}-{{ $faq->getKey() }}"
                                                        aria-expanded="false"
                                                        aria-controls="faq-answer-{{ $categorySlug }}-{{ $faq->getKey() }}">
                                                    <span class="faq-question-text">{!! BaseHelper::clean($faq->question) !!}</span>
                                                    <span class="faq-icon">
                                                        <span class="faq-icon-plus">+</span>
                                                        <span class="faq-icon-minus">−</span>
                                                    </span>
                                                </button>
                                            </div>
                                            <div id="faq-answer-{{ $categorySlug }}-{{ $faq->getKey() }}"
                                                 class="faq-answer">
                                                <div class="faq-answer-content">
                                                    {!! BaseHelper::clean($faq->answer) !!}
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    @endforeach
            @endswitch
        </div>
    </div>
</section>
