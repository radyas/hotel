<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
    public function addUser(Request $request)
    {
        // return $request->all();
        $name = $request->input('name');
        $nic = $request->input('nic');
        $email = $request->input('email');
        $password = $request->input('password',bcrypt('Abcd123@'));
        $birthday = gmdate("Y-m-d", strtotime($request->input('birthday')));

        User::addUser($name,$nic,$birthday,$email,$password);

        $request->session()->flash('success', 'User has been added Successfully');

        return redirect()->back();
    }
}
