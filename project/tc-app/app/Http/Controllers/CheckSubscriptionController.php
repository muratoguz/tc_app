<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CheckSubscriptionController extends Controller
{
    public function checkSubscription(Request $request): JsonResponse
    {
        $clientToken = $request->header('client-token');
        //todo client-token will get on redis
        $result = DB::table('devices')
            ->join('purchases', 'devices.u_id', '=', 'purchases.u_id')
            ->join('applications', 'purchases.app_id', '=', 'applications.id')
            ->where('client_token', $clientToken)
            ->select('purchases.expire_date', 'purchases.status', 'applications.app_name')->get();

        if(!$result) {
            return response()->json(['status' => false, 'message' => 'Not found'], 404);
        } else {
            return response()->json($result);
        }
    }
}
