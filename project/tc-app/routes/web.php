<?php

use App\Models\Purchase;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;

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
    return view('index');
});

Route::get('/run-expired-commands', function () {
    Artisan::call('tcapp:expiredsubs ' . Purchase::Started);
});

Route::get('/run-expired-commands', function () {
    Artisan::call('tcapp:expiredsubs ' . Purchase::Pending);
});

Route::get('/cache-os', function () {
    Artisan::call('cache:create_os');
});

Route::get('/cache-app', function () {
    Artisan::call('cache:create_app');
});

Route::get('/cache-device', function () {
    Artisan::call('cache:create_device');
});
