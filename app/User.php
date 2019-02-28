<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','birthday','NIC'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public static function addUser($name,$nic,$birthday,$email,$password)
    {
        return self::updateOrCreate(
            ['email' => $email],
            ['name' => $name, 'NIC' => $nic, 'birthday' => $birthday, 'password' => $password]
        );
    }
}
