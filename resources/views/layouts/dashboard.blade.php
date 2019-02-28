@extends('layouts.master')

@section('fonts')
    @yield('content_fonts')
@endsection

@section('styles')

    <!-- flag icons -->
    <link rel="stylesheet" href="{{asset('icons/flags/flags.min.css')}}" media="all">

    <!-- altair admin -->
    <link rel="stylesheet" href="{{asset('css/main.min.css')}}" media="all">

    @yield('content_styles')
@endsection

@section('body')
    "sidebar_main_open"
@endsection

@section('content')

    <!-- main header -->
    <header id="header_main">
        <div class="header_main_content">
            <nav class="uk-navbar">
                <div class="uk-navbar-flip">
                    <ul class="uk-navbar-nav user_actions">
                        <li data-uk-dropdown="{mode:'click'}">
                            <a href="#" class="user_action_image">
                                <img class="md-user-image" src="{{asset('img/avatars/avatar_11_tn.png')}}" alt=""/>
                            </a>
                            <div class="uk-dropdown uk-dropdown-small uk-dropdown-flip">
                                <ul class="uk-nav js-uk-prevent">
                                    {{--  <li><a href="page_user_profile.html">My profile</a></li>  --}}
                                    {{--  <li><a href="page_settings.html">Settings</a></li>  --}}
                                    <li><a href="{{ route('logout') }}"
                                        onclick="event.preventDefault();
                                                      document.getElementById('logout-form').submit();">
                                         {{ __('Logout') }}</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
            @csrf
        </form>

    </header><!-- main header end -->

    <!-- main sidebar -->
    <aside id="sidebar_main">
        <a href="#" class="uk-close sidebar_main_close_button"></a>
        <div class="sidebar_main_header">
            <div class="sidebar_logo">
                <a href="index.html">
                    <img src="{{asset('img/logo_main.png')}}" alt="" height="15" width="71"/>
                </a>
            </div>
        </div>
        <div class="menu_section">
            <ul>
                <li>
                    <a href="{{ route('home')}}">
                        <span class="menu_icon uk-icon-th-large"></span>
                        Dashboard
                    </a>
                </li>
                <li>
                    <a href="{{url('user')}}">
                        <span class="menu_icon uk-icon-user"></span>
                        Add User
                    </a>
                </li>
                <li>
                    <a href="{{url('meeting')}}">
                        <span class="menu_icon uk-icon-calendar"></span>
                        Add Meeting
                    </a>
                </li>
                <li>
                    <a href="{{url('consultant')}}">
                        <span class="menu_icon uk-icon-user"></span>
                        Add Consultant
                    </a>
                </li>
                <li>
                    <a href="{{url('event')}}">
                        <span class="menu_icon uk-icon-calendar"></span>
                        Add Event
                    </a>
                </li>
                <li>
                    <a href="{{url('profile')}}">
                        <span class="menu_icon uk-icon-user"></span>
                        Add Profile
                    </a>
                </li>
            </ul>
        </div>
    </aside><!-- main sidebar end -->

    <div id="page_content">
        <div id="page_content_inner">
            <div class="uk-grid" data-uk-grid-margin>
                <div class="uk-width-medium-1-6"></div>
                <div class="uk-width-medium-2-3">
                    @yield('content_body')
                </div>
                <div class="uk-width-medium-1-6"></div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        WebFontConfig = {
            google: {
                families: [
                    'Source+Code+Pro:400,700:latin',
                    'Roboto:400,300,500,700,400italic:latin'
                ]
            }
        };
        (function() {
            var wf = document.createElement('script');
            wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
            '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
            wf.type = 'text/javascript';
            wf.async = 'true';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(wf, s);
        })();
    </script>

    <!-- momentJS date library -->
    <script src="{{asset('bower_components/moment/min/moment.min.js')}}"></script>
    <!-- uikit functions -->
    <script src="{{asset('js/uikit_custom.min.js')}}"></script>
    <!-- enable hires images -->
    <script>
        $(function() {
            altair_helpers.retina_images();
        });
    </script>
    @yield('content_scripts')
@endsection
