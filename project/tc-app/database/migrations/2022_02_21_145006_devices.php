<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('devices', function (Blueprint $table) {
            $table->id(); // same as u_id
            $table->string('u_id')->unique()->index();
            $table->string('lang'); //this value of language table but not created for this app
            $table->integer('os_id');
            $table->string('client_token', 80)
                ->index()
                ->unique()
                ->nullable()
                ->default(null);
            $table->boolean('is_active')->default(true); //Device status
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('devices');
    }
};
