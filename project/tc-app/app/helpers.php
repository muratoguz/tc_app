<?php

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use JetBrains\PhpStorm\ArrayShape;

/**
 * @throws Exception
 */
function createReceipt($length=30): string
{
    return \Illuminate\Support\Str::random(30-2) . random_int(10,99);
}

function googleIosRequestEndpoint($validationURL, $receipt, $appRes, $isCron = false): mixed
{
    $requestHost = env('GOOGLE_IOS_HOST','127.0.0.1');
    $localPort = env('LOCAL_PORT','127.0.0.1');

    Log::info("User Infos: {$appRes->user_name}, {$appRes->password}, URL: {$validationURL}, Receipt:{$receipt}, Cron: $isCron");
    $deviceResponse = Http::withBasicAuth($appRes->user_name, $appRes->password)
        ->post(
            "http://{$requestHost}:{$localPort}/api/{$validationURL}",
            ['receipt' => $receipt, 'is_cron'=>$isCron]
        );

    return json_decode($deviceResponse->body());
}

#[ArrayShape(['status' => "bool", 'message' => "string", 2 => "int"])] function googleIosApiCommonContent(Request $request): array
{
    $users = ['app1', 'app2', 'app3', 'app4', 'app5'];
    if (!isset($_SERVER['PHP_AUTH_USER'])) {
        header('WWW-Authenticate: Basic realm="My Realm"');
        header('HTTP/1.0 401 Unauthorized');
        $result =  ['status'=> false, 'message' => "Not auth", 401];
    } else {
        if (!in_array($_SERVER['PHP_AUTH_USER'], $users) || !in_array($_SERVER['PHP_AUTH_PW'], $users)){
            $result = ['status'=> false, 'message' => "Wrong Credentials!", 401];
        } else {
            $valid = (int)substr($request->input('receipt'), -2);
            $isCron = $request->input('is_cron');
            if ($valid != 0 && $valid % 2 == 0) {
                if ($isCron && $valid % 3 == 0) {
                    $result = ['status' => false, 'message'=>'Rate limit error', 'status_code'=>406];
                } else {
                    $result = ['status' => false, 'message' => 'Device could not be verified', 'status_code' => 403];
                }
            } else {
                $dateTime = new Carbon('now', new \DateTimeZone("UTC"));
                // one year add for purchase
                $expireDate = $dateTime->addYear()->toDateTimeString();
                //$expireDate = \Illuminate\Support\Carbon::createFromTimestamp(strtotime($dateTime), new \DateTimeZone("GMT+6"));
                $result = [
                    'status' => true,
                    'expire_date' => $expireDate
                ];
            }
        }
    }


    return $result;
}

function getAppByID($appID): mixed
{
    if(Cache::has('app_'.$appID)) {
        Log::info("[getAppByID] -> Cache : {$appID}" );
        $appRes = json_decode(Cache::get('app_' . $appID));
    } else {
        Log::info("[getAppByID] -> DB : {$appID}" );
        $appRes = DB::table('applications')->select('os_id', 'user_name', 'password')
            ->where('id', '=', $appID)->first();
    }

    return $appRes;
}

function getAllAppUserInfo(): array
{
    $arr = [];
    $allApps = DB::table('applications')->select('id', 'os_id', 'user_name', 'password')->get();
    foreach ($allApps as $app) {
        $arr[$app->id] = (object)['user_name' => $app->user_name, 'password' => $app->password];
    }
    return $arr;
}

function getOsByAppID($osID): mixed
{
    //find which os for request service
    if(Cache::has('os_'.$osID)) {
        Log::info("[GetOSByID] -> Cache : {$osID}" );
        $osRes = json_decode(Cache::get('os_'.$osID));
    } else {
        Log::info("[GetOSByID] -> DB : {$osID}" );
        $osRes = DB::table('operating_systems')
            ->where('id', $osID)
            ->get();
    }

    return $osRes;
}

function getOsValidationURLByAppID($osID): mixed
{
    //find which os for request service
    if(Cache::has('os_'.$osID)) {
        Log::info("[getOsValidationURLByAppID] -> Cache : {$osID}" );
        $url = Cache::get('os_'.$osID);
    } else {
        Log::info("[getOsValidationURLByAppID] -> DB : {$osID}" );
        $url = DB::table('operating_systems')
            ->where('id', $osID)
            ->value('validation_url');
    }

    return $url;
}

function getDeviceUIDByToken($clientToken): string
{
    if (Cache::has($clientToken)) {
        Log::info("[getDeviceUIDByToken] -> Cache : {$clientToken}" );
        $deviceUID = Cache::get($clientToken);
    } else {
        Log::info("[getDeviceUIDByToken] -> DB : {$clientToken}" );
        $deviceUID = DB::table('devices')
            ->where('client_token', $clientToken)
            ->value('u_id');
    }

    return $deviceUID;
}
