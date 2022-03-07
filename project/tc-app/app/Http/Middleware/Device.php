<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

class Device
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
        //todo extra control will be has app_id
        $key = $request->input('uid');
        if (Cache::has($key)) {
            Log::info("[DEVICE_CONTROL] -> {$key}");
            return response()->json(['result'=>'Already Register OK', 'client-token' => Cache::get($key)]);
        }
        return $next($request);
    }
}
