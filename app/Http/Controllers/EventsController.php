<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EventsController extends Controller
{
    public function addEvent(Request $request)
    {
        $date = $request->input('date');
        $event = $request->input('event');
        $start = gmdate('Y-m-d H:i:s', strtotime($date.' '.$request->input('start')));
        $end = gmdate('Y-m-d H:i:s', strtotime($date.' '.$request->input('end')));
    }
}
