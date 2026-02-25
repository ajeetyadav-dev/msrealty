<ul>
    @foreach($items as $item)
        <li>
            <p><a href="{{ $item->url }}">{{ $item->name }}</a></p>
            <p>{{ $item->short_address }}</p>
        </li>
    @endforeach
</ul>
