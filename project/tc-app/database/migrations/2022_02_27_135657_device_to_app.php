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
        Schema::create('device_to_app', function (Blueprint $table) {
            $table->string('u_id')->index(); //device id
            $table->integer('app_id');
            $table->unique(['u_id', 'app_id']);
            //$table->foreign('u_id')->references('u_id')->on('devices')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('device_to_app');
    }
};
