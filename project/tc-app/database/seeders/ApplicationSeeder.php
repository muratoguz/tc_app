<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ApplicationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('applications')->insert(
            [
                [
                    'os_id' => 1,
                    'app_name' => 'App Name 1',
                    'user_name' => 'app1',
                    'password' => 'app1',
                    'is_active' => true,
                    'third_party_endpoint' => 'http:://localhost/api/app/1',
                ],
                [
                    'os_id' => 2,
                    'app_name' => 'App Name 2',
                    'user_name' => 'app2',
                    'password' => 'app2',
                    'is_active' => true,
                    'third_party_endpoint' => 'http:://localhost/api/app/2',
                ],
                [
                    'os_id' => 2,
                    'app_name' => 'App Name 3',
                    'user_name' => 'app3',
                    'password' => 'app3',
                    'is_active' => true,
                    'third_party_endpoint' => 'http:://localhost/api/app/3',
                ],
                [
                    'os_id' => 1,
                    'app_name' => 'App Name 4',
                    'user_name' => 'app4',
                    'password' => 'app4',
                    'is_active' => true,
                    'third_party_endpoint' => 'http:://localhost/api/app/4',
                ],
                [
                    'os_id' => 1,
                    'app_name' => 'App Name 5',
                    'user_name' => 'app5',
                    'password' => 'app5',
                    'is_active' => false,
                    'third_party_endpoint' => 'http:://localhost/api/app/5',
                ],
            ]
        );
    }
}
