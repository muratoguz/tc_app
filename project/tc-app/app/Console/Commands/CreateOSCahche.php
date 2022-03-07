<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redis;

class CreateOSCahche extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cache:create_os';

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
        $prefix = 'os_';
        $results =DB::table('operating_systems')
            ->select('id', 'validation_url')
            ->where('is_active', '=', true)->get();

        foreach ($results as $result){
            Log::info('[cache:create_os] -> ID:' . $result->id . ' - ' . $result->validation_url);
            if (!Cache::has($prefix.$result->id))
                Cache::put($prefix.$result->id, $result->validation_url);

            /*if (!Cache::has($prefix.$result->id)) {
                Cache::put($prefix.$result->id, json_encode([
                    'name' => $result->name,
                    'validation_url' => $result->validation_url,
                    'support' => $result->support,
                    'is_active' => $result->is_active,
                ]));
            }*/
        }

        //Log::info('ID:' . Cache::get($prefix.'1'));

    }
}
