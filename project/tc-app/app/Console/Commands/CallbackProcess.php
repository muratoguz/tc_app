<?php

namespace App\Console\Commands;

use App\Models\Purchase;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class CallbackProcess extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'call:back {status}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $status = $this->argument('status');
        $currentDate = Carbon::now()->subDays(1);
        $chunkCount = 1000;
        DB::table('purchases')
            ->where('status_callback', '!=', $status)
            ->whereDate('updated_at', '=', $currentDate)
            ->select('u_id', 'app_id', 'os_validation_url')
            ->chunkById($chunkCount, function ($purchases) {
                foreach ($purchases as $purchase) {
                    $deviceResponse = Http::post(
                            "https://{$purchase->os_validation_url}",
                            ['appID' => $purchase->app_id, 'deviceID'=>$purchase->u_id]
                        );

                    $result = json_decode($deviceResponse->body());
                    if (in_array((int)$result->status_code, [200, 2001])){
                        $update = ['status_callback'=>Purchase::Done];
                    } else {
                        $update = ['status_callback'=>Purchase::SendAgain];
                    }

                    DB::table('purchases')
                        ->where('id', $purchase->id)
                        ->update($update);
                }
            });
    }
}
