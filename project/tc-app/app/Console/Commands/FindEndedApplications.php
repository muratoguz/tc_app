<?php

namespace App\Console\Commands;

use App\Models\Purchase;
use Carbon\Traits\Date;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class FindEndedApplications extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'tcapp:expiredsubs {status}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Find expired subscriptions';

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
     * if last affaceted id is not exist or
     * bigger than registered current id
     *
     * @var int
     */
    protected int $lastID = 0;

    /**
     * Execute the console command.
     *
     * @return void
     * @throws \Exception
     */
    public function handle()
    {
        $currentDate = Carbon::now();
        $controlDate = $currentDate->addDay()->addYear(); //todo added year for test
        $status = $this->argument('status');
        $chunkCount = 5; //Count regulable e.g. 10000
        $appUserInfo = getAllAppUserInfo();
        Log::info("[COMMAND:tcapp:expiredsubs] -> Cron started for {$status} at $currentDate");
        DB::table('purchases')
            ->where('is_active', '=', true)
            ->where('status', '=', $status)
            ->whereDate('expire_date', '<', $controlDate)
            ->select('id', 'app_id', 'os_validation_url')
            ->orderBy('id')->chunkById($chunkCount, function ($purchases) use ($status, $appUserInfo) {
                foreach ($purchases as $purchase) {
                    $receipt = createReceipt();
                    $result = googleIosRequestEndpoint($purchase->os_validation_url, $receipt, $appUserInfo[$purchase->app_id], true);
                    //success
                    if($result->status) {
                        $update = [
                            'expire_date' => $result->expire_date,
                            'status' => Purchase::Renewed,
                        ];
                    } else {
                        //rate-limit
                        if($result->status_code == 406) {
                            $update = [
                                'status' => Purchase::Pending,
                            ];
                        } else {
                            //cancelled
                            $update = [
                                'status' => Purchase::Cancelled,
                            ];
                        }
                    }
                    //for callback
                    if($status != $update['status']){
                        $update['status_callback'] = Purchase::Waiting;
                    }

                    DB::table('purchases')
                        ->where('id', $purchase->id)
                        ->update($update);
                }

            });
    }
}
