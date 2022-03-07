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
        Schema::create('applications', function (Blueprint $table) {
            $table->id(); //app_id on devices table
            $table->integer('os_id')->index();
            $table->string('app_name');
            $table->string('user_name'); //for app validate
            $table->string('password'); //for app validate
            $table->boolean('is_active')->default(true); //app status
            $table->string('third_party_endpoint'); //for callbacks
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
        Schema::dropIfExists('applications');
    }
};
