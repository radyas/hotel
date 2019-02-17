@extends('layouts.master')

@section('fonts')
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500' rel='stylesheet' type='text/css'>    
@endsection

@section('styles')
    <!-- altair admin login page -->
    <link rel="stylesheet" href="{{asset('css/login_page.min.css')}}" />
@endsection

@section('body')
    "login_page"
@endsection
@section('content')
    <div class="login_page_wrapper">
        <div class="md-card" id="login_card">
            <div class="md-card-content large-padding" id="login_form">
                <div class="login_heading">
                    <div class="user_avatar"></div>
                </div>
                <form method="POST" action="{{ route('login') }}">
                    @csrf
                    <div class="uk-form-row">
                        <label for="login_username">Email</label>
                        <input class="md-input" type="email" id="login_username" name="email" value="{{ old('email') }}" required autofocus/>
                    </div>
                    <div class="uk-form-row">
                        <label for="password">Password</label>
                        <input class="md-input" type="password" id="password" name="password" />
                    </div>
                    <div class="uk-margin-medium-top">
                        <button class="md-btn md-btn-primary md-btn-block md-btn-large" type="submit">Sign In</button>
                    </div>
                    <div class="uk-margin-top">
                        <span class="icheck-inline">
                            <input type="checkbox" name="login_page_stay_signed" id="login_page_stay_signed" data-md-icheck />
                            <label for="login_page_stay_signed" class="inline-label">Stay signed in</label>
                        </span>
                    </div>
                </form>
            </div>
            <div class="md-card-content large-padding uk-position-relative" id="login_help" style="display: none">
                <button type="button" class="uk-position-top-right uk-close uk-margin-right uk-margin-top" id="login_help_close"></button>
                <h2 class="heading_b uk-text-success">Can’t log in?</h2>
                <p>Here’s the info to get you back in to your account as quickly as possible.</p>
                <p>First, try the easiest thing: if you remember your password but it isn’t working, make sure that Caps Lock is turned off, and that your username is spelled correctly, and then try again.</p>
                <p>If your password still isn’t working, it’s time to <a href="#" id="login_password_reset_show">reset your password</a>.</p>
            </div>
            <div class="md-card-content large-padding" id="login_password_reset" style="display: none">
                <h2 class="heading_a uk-margin-large-bottom">Reset password</h2>
                <form action="">
                    <div class="uk-form-row">
                        <label for="login_email_reset">Your email address</label>
                        <input class="md-input" type="text" id="login_email_reset" name="login_email_reset" />
                    </div>
                    <div class="uk-margin-medium-top">
                        <button class="md-btn md-btn-primary md-btn-block">Reset password</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="uk-margin-top">
            <a href="#" id="login_help_show">Need help?</a>
        </div>
    </div>
    
@endsection

@section('scripts')
    <!-- altair login page functions -->
    <script src="{{asset('js/pages/login_page.min.js')}}"></script>
@endsection