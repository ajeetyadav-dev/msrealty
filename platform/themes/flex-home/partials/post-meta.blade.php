<div class="post-meta">
    <p class="d-inline-block">
        <span class="date-meta"><i class="fa fa-calendar"></i> {{ Theme::formatDate($post->created_at) }} </span>
        <span class="category-meta"> {{ __('in') }} @foreach($post->categories as $category)
            <a href="{{ $category->url }}">{{ $category->name }}</a>
            @if (!$loop->last)
                ,
            @endif
        @endforeach
        </span>
    </p>
    <span class="first-meta-separator"> - </span><p class="d-inline-block"><i class="fa fa-eye"></i> {{ number_format($post->views) }}</p>
</div>
