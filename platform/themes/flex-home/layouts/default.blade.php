@extends(Theme::getThemeNamespace('layouts.base'))

@section('content')
    {!! Theme::partial('header') !!}

    <div id="app">
        {!! Theme::content() !!}
    </div>

    {!! Theme::partial('footer') !!}
@endsection
