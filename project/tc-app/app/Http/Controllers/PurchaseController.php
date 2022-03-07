<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PurchaseController extends Controller
{
    public function savePurchase(Request $request) {
        try {
            DB::beginTransaction();
            $purchase = new Purchase();
            $purchase->u_id = $request->input('u_id');
            $purchase->app_id = $request->input('app_id');
            $purchase->receipt = $request->input('receipt');
            $purchase->expire_date = $request->input('expire_date');
            $purchase->os_validation_url = $request->input('os_validation_url');
            $purchase->save();
            DB::commit();
            return response()->json(['status'=>true, 'message'=>'Purchase id: ' . $purchase->id], 201);
        } catch (\Throwable $e) {
            DB::rollBack();
            return response(['status' => false, 'message' => $e->getMessage()], 400);
        }
    }
}
