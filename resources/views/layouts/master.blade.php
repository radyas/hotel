<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    @yield('fonts')

    <!-- Styles -->
    <!-- uikit -->
    <link rel="stylesheet" href="{{asset('bower_components/uikit/css/uikit.almost-flat.min.css')}}"/>
    @yield('styles')

</head>
<body class=@yield('body')>

    @yield('content')

    <!-- Scripts -->
    <!-- common functions -->
    <script src="{{asset('js/common.min.js')}}"></script>
    <!-- altair core functions -->
    <script src="{{asset('js/altair_admin_common.min.js')}}"></script>

    @yield('scripts')
    
</body>
</html>
