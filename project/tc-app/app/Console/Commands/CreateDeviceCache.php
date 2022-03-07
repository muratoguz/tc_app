<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CreateDeviceCache extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cache:create_device';

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
     * @return void
     */
    public function handle()
    {
        $devices =DB::table('devices')
            ->select('u_id', 'client_token')
            ->where('is_active', '=', true)->get();

        foreach ($devices as $device) {
            Log::info('[cache:create_device] -> U_ID:' . $device->u_id .  ' - C. Token: ' .$device->client_token );
            if (!Cache::has($device->u_id)) {
                Cache::put($device->u_id, $device->client_token);
            }

            if (!Cache::has($device->client_token)) {
                Cache::put($device->client_token, $device->u_id);
            }
        }
    }
}
