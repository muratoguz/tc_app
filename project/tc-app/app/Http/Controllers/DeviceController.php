<?php

namespace App\Http\Controllers;

use App\Models\Device;
use App\Models\DeviceToApp;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Str;

class DeviceController extends Controller
{
    //
    public function register(Request $request) {
        try {
            DB::beginTransaction();
            $device = new Device();
            $device->u_id = $request->input('uid');
            $device->lang = $request->input('lang');
            $device->os_id = $request->input('os');
            $device->client_token = Str::random(60);

            $device->save();

            $devToApp = new DeviceToApp();
            $devToApp->u_id = $device->u_id;
            $devToApp->app_id = $request->input('app_id');
            $devToApp->save();

            DB::commit();
            //write redis cross
            Cache::put($device->u_id, $device->client_token);
            Cache::put($device->client_token, $device->u_id);
            return response()->json(['result'=>'Register OK', 'client-token' => $device->client_token, 'u_id'=>$device->u_id],  201);
        } catch (\Throwable $e) {
            DB::rollBack();
            Log::error('[DEVICE_REGISTER] -> ' . $e->getMessage());
            //todo message should be delete before sending prod
            return response($e->getMessage() .' /' .  $request->input('uid'), 400); //->json(array('status'=>'FAIL', 'Error'=>$e->getCode()));
        }

    }
}
