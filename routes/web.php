<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function () {
    return view('auth.login');
});

Route::group(['middleware' => ['auth']], function () {
    Route::get('consultant', function () {
        return view('consultants');
    });
    Route::get('event', function () {
        return view('events');
    });
    Route::get('meeting', function () {
        return view('meetings');
    });
    Route::get('profile', function () {
        return view('profiles');
    });
    Route::get('user', function () {
        return view('user');
    });
    Route::get('/home', 'HomeController@index')->name('home');
    Route::post('user', 'UserController@addUser');
    Route::post('event', 'EventsController@addEvent');
    Route::post('meeting', 'MeetingsController@addMeeting');
});

Auth::routes();


