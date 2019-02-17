@extends('layouts.dashboard')

@section('content_styles')
    <!-- kendo UI -->
    <link rel="stylesheet" href="{{asset('bower_components/kendo-ui-core/styles/kendo.common-material.min.css')}}"/>
    <link rel="stylesheet" href="{{asset('bower_components/kendo-ui-core/styles/kendo.material.min.css')}}"/>

@endsection

@section('content_body')
    <h3 class="heading_b uk-margin-bottom">Add Meeting</h3>

    <div class="md-card">
        <div class="md-card-content">
            <div class="uk-grid" data-uk-grid-margin>
                <div class="uk-width-1-1">
                    <div class="uk-form-row">
                        <div class="md-input-wrapper">
                            <label for="uk_dp_1">Select date</label>
                            <input class="md-input" type="text" id="uk_dp_1" data-uk-datepicker="{format:'DD.MM.YYYY'}">
                            <span class="md-input-bar"></span>
                        </div>
                    </div>
                </div>
                    
                <div class="uk-width-1-1">
                    <div class="uk-form-row">
                        <div class="md-input-wrapper">
                            <label>Reason</label>
                            <input name="reason" type="text" class="md-input">
                            <span class="md-input-bar"></span>
                        </div>
                    </div>
                </div>

                
            </div>
        </div>
    </div>
@endsection

@section('content_scripts')
    <!-- page specific plugins -->
    <!-- kendo UI -->
    <script src="{{asset('js/kendoui.custom.min.js')}}"></script>

    <!--  kendoui functions -->
    <script src="{{asset('js/pages/kendoui.min.js')}}"></script>

@endsection