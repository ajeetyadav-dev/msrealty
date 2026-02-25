<!DOCTYPE html>
<html {!! Theme::htmlAttributes() !!}>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=5, user-scalable=1" name="viewport"/>

    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style>
        :root {
            --primary-color: {{ theme_option('primary_color', '#1d5f6f') }};
            --primary-color-rgb: {{ BaseHelper::hexToRgba(theme_option('primary_color', '#1d5f6f'), 0.8) }};
            --primary-color-hover: {{ theme_option('primary_color_hover', '#063a5d') }};
        }
    </style>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    {!! Theme::header() !!}
</head>
<body {!! Theme::bodyAttributes() !!}>
    {!! apply_filters(THEME_FRONT_BODY, null) !!}
    <div id="alert-container"></div>

    @yield('content')

    {!! Theme::footer() !!}
</body>
</html>
