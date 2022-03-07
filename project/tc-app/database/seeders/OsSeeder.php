<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('operating_systems')->insert(
            [
                [
                    'name' => 'Android OS',
                    'is_active' => true,
                    'support' => true,
                    'validation_url' => 'google',
                ],

                [
                    'name' => 'Apple iOS',
                    'is_active' => true,
                    'support' => true,
                    'validation_url' => 'ios',
                ],

                [
                    'name' => 'Symbian OS',
                    'is_active' => false,
                    'support' => false,
                    'validation_url' => 'symb',
                ],

                [
                    'name' => 'Blackberry OS',
                    'is_active' => false,
                    'support' => false,
                    'validation_url' => 'bberry',
                ],

                [
                    'name' => 'Windows Mobile OS',
                    'is_active' => false,
                    'support' => false,
                    'validation_url' => 'mswindow',
                ],

            ]
        );
    }
}
