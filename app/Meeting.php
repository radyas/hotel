<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Meeting extends Base
{
    protected $table = 'meeting';

    protected $fillable = [
        'refno','date','appointment_time','arrival_time','reason','visitors_count', 'added_sys'
    ];

    public static function addMeeting($date=null,$appointment=null,$arrival=null,$reason=null,$visitors=null,$ref,$data=null)
    {
        return self::create([
            'refno' => $ref,
            'date' => $date,
            'appointment_time' => $appointment,
            'arrival_time' => $arrival,
            'reason' => $reason,
            'visitors_count' => $visitors,
            'added_sys' => $data,
        ]);
    }
}
