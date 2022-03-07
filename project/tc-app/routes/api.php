<?php

use App\Http\Controllers\CheckSubscriptionController;
use App\Http\Controllers\GoogleDeviceValidateAPI;
use App\Http\Controllers\IOSDeviceValidateAPI;
use App\Http\Controllers\PurchaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DeviceController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('device.has')->post('/register', [DeviceController::class, 'register']);
Route::middleware('device.verification')->post('/purchase', [PurchaseController::class, 'savePurchase']);
Route::get('/check-sub', [CheckSubscriptionController::class, 'checkSubscription']);

//Device validate route
Route::post('/google', [GoogleDeviceValidateAPI::class, 'isValidDevice']);
Route::post('/ios', [IOSDeviceValidateAPI::class, 'isValidDevice']);
