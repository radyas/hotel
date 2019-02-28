@extends('layouts.dashboard')

@section('content_styles')
    <!-- kendo UI -->
    <link rel="stylesheet" href="{{asset('bower_components/kendo-ui-core/styles/kendo.common-material.min.css')}}"/>
    <link rel="stylesheet" href="{{asset('bower_components/kendo-ui-core/styles/kendo.material.min.css')}}"/>

@endsection

@section('content_body')
    <h3 class="heading_b uk-margin-bottom">Add Meeting</h3>

    <form action="{{url('meeting')}}" method="post">
        @csrf
        <div class="md-card">
            <div class="md-card-content">
                <div class="uk-grid" data-uk-grid-margin>
                    <div class="uk-width-1-1">
                        <div class="uk-form-row">
                            <div class="md-input-wrapper">
                                <label>Refno</label>
                                <input name="ref" type="text" class="md-input" required autofocus>
                                <span class="md-input-bar"></span>
                            </div>
                        </div>
                    </div>

                    <div class="uk-width-1-1">
                        <div class="uk-form-row">
                            <div class="md-input-wrapper">
                                <label for="uk_dp_1">Select date</label>
                                <input name='date' class="md-input" type="text" id="uk_dp_1" data-uk-datepicker="{format:'DD.MM.YYYY'}">
                                <span class="md-input-bar"></span>
                            </div>
                        </div>
                    </div>

                    <div class="uk-width-large-1-2 uk-width-medium-1-1">
                        <div class="uk-input-group">
                            <span class="uk-input-group-addon">
                                <i class="uk-input-group-icon uk-icon-clock-o"></i>
                            </span>
                            <label for="uk_tp_1">Appointment time</label>
                            <input class="md-input" name="appointment" type="text" id="uk_tp_1" data-uk-timepicker>
                        </div>
                    </div>

                    <div class="uk-width-large-1-2 uk-width-medium-1-1">
                        <div class="uk-input-group">
                            <span class="uk-input-group-addon">
                                <i class="uk-input-group-icon uk-icon-clock-o"></i>
                            </span>
                            <label for="uk_tp_1">Arrival time</label>
                            <input class="md-input" name="arrival" type="text" id="uk_tp_2" data-uk-timepicker>
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

                    <div class="uk-width-1-1">
                        <div class="uk-form-row">
                            <div class="md-input-wrapper">
                                <label>Visitor Count</label>
                                <input name="visitors" type="number" class="md-input">
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
