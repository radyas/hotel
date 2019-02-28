<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Meeting;

class MeetingsController extends Controller
{
    public function addMeeting(Request $request)
    {
        $date = $request->input('date');

        if ($request->input('appointment') !== null && $request->input('date') !== null) {
            $appointment = gmdate("Y-m-d H:i:s", strtotime($date.' '.$request->input('appointment')));
        }
        else
        {
            $appointment = null;
        }

        if ($request->input('arrival') !== null && $request->input('date') !== null) {
            $arrival = gmdate("Y-m-d H:i:s", strtotime($date.' '.$request->input('arrival')));
        }
        else
        {
            $arrival = null;
        }

        $reason = $request->input('reason');
        $visitors = $request->input('visitors');
        $ref = $request->input('ref');

        if(empty($reason)|empty($visitors)|empty($ref)|empty($appointment)|empty($arrival)|empty($date))
        {
            $data = 1;
        }
        else
        {
            $data = 0;
        }

        $date = gmdate("Y-m-d", strtotime($date));

        Meeting::addMeeting($date,$appointment,$arrival,$reason,$visitors,$ref,$data);

        $request->session()->flash('success', 'Meeting has been added Successfully');

        return redirect()->back();
    }
}
