@extends('layouts.dashboard')

@section('content_styles')
    <!-- kendo UI -->
    <link rel="stylesheet" href="{{asset('bower_components/kendo-ui-core/styles/kendo.common-material.min.css')}}"/>
    <link rel="stylesheet" href="{{asset('bower_components/kendo-ui-core/styles/kendo.material.min.css')}}"/>

@endsection

@section('content_body')
    <h3 class="heading_b uk-margin-bottom">Add Consultant</h3>

    <form action="{{url('consultant')}}" method="post">
        @csrf
        <div class="md-card">
            <div class="md-card-content">
                <div class="uk-grid" data-uk-grid-margin>
                    <div class="uk-width-1-1">
                        <div class="uk-form-row">
                            <div class="md-input-wrapper">
                                <label>Name</label>
                                <input name="name" type="text" class="md-input">
                                <span class="md-input-bar"></span>
                            </div>
                        </div>
                    </div>

                    <div class="uk-width-1-1">
                        <div class="uk-form-row">
                            <div class="md-input-wrapper">
                                <label>Speciality</label>
                                <input name="speciality" type="text" class="md-input">
                                <span class="md-input-bar"></span>
                            </div>
                        </div>
                    </div>

                    <div class="uk-width-1-3"></div>
                    <div class="uk-width-1-3">
                        <div class="md-input-wrapper">
                            <button class="md-btn md-btn-flat md-btn-flat-primary" type="submit">Submit</button>
                            <button class="md-btn md-btn-flat md-btn-flat-default" type="reset">Reset</button>
                        </div>
                    </div>
                    <div class="uk-width-1-3"></div>
                </div>
            </div>
        </div>
    </form>
@endsection

@section('content_scripts')
    <!-- page specific plugins -->
    <!-- kendo UI -->
    <script src="{{asset('js/kendoui.custom.min.js')}}"></script>

    <!--  kendoui functions -->
    <script src="{{asset('js/pages/kendoui.min.js')}}"></script>

@endsection
