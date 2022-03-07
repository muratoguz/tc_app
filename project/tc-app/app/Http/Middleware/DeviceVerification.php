<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DeviceVerification
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\JsonResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $clientToken = $request->header('client-token');
        $appID = $request->input('app_id');

        //find device via client-token
        $deviceUID = getDeviceUIDByToken($clientToken);
        if(!$deviceUID) {
            return response()->json(['status' => false, 'message' => 'Device not found'], 404);
        }
        //purchased before
        //todo will be save redis for perform?
        $purchased = DB::table('purchases')
            ->where('u_id', '=', $deviceUID)
            ->where('app_id', '=', $appID)
            ->select('id')
            ->first();

        if($purchased) {
            return response()->json(['status' => false, 'message' => 'Application purchased before. Purchase id :' . $purchased->id], 404);
        }

        $appRes = getAppByID($appID);
        if(!$appRes) {
            return response()->json(['status' => false, 'message' => 'Application not found'], 404);
        }

        //find which os for request service
        /*$osRes = getOsByAppID($appRes->os_id);
        if(!$osRes) {
            return response()->json(['status' => false, 'message' => 'Operating system not found'], 404);
        }*/

        //$validationURL = $osRes->validation_url;
        $validationURL = getOsValidationURLByAppID($appRes->os_id);
        if(!$validationURL) {
            return response()->json(['status' => false, 'message' => 'Operating request url not found'], 404);
        }

        $result = googleIosRequestEndpoint($validationURL, $request->input('receipt'), $appRes);
        if ($result->status == false) {
            return response()->json($result, $result->status_code);
        }

        $request->request->add(['expire_date' => $result->expire_date, 'u_id' =>$deviceUID, 'os_validation_url'=>$validationURL]);

        return $next($request);
    }
}
