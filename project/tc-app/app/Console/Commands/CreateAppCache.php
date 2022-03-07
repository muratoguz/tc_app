<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CreateAppCache extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cache:create_app';

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
        $prefix = 'app_';
        $results =DB::table('applications')
            ->select('id', 'os_id', 'user_name', 'password', 'third_party_endpoint')
            ->where('is_active', '=', true)->get();

        foreach ($results as $result){
            Log::info('[cache:create_app] -> ID:' . $result->id );
            if (!Cache::has($prefix.$result->id)) {
                Cache::put($prefix.$result->id, json_encode([
                    'os_id' => $result->os_id,
                    'user_name' => $result->user_name,
                    'password' => $result->password,
                    'third_party_endpoint' => $result->third_party_endpoint,
                ]));
            }
        }
    }
}
