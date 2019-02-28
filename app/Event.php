<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Event extends Base
{
    protected $table = 'events';

    protected $fillable = [
        'event','start_time','end_time','eventscol'
    ];

    public static function addEvent($event,$start=null,$endl=null)
    {
        return self::create([
            'event' => $event,
            'start_time' => $start,
            'end_time' => $end,
        ]);
    }
}
