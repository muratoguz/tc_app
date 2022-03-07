<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;

class IOSDeviceValidateAPI extends Controller
{
    public function isValidDevice(Request $request)
    {
        $result = googleIosApiCommonContent($request);
        return response()->json($result);
    }
}
