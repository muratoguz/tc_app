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
        Schema::create('purchases', function (Blueprint $table) {
            $table->id();
            $table->string('u_id')->index();
            $table->integer('app_id')->index();
            $table->string('receipt');
            $table->boolean('is_active')->default(true);
            $table->string('status', '10')->default('started')->index(); //started, renewed, canceled, pending
            $table->string('status_callback', '10')->nullable(); //waiting, done, send-again
            $table->timestampTz('expire_date')->index();
            $table->string('os_validation_url', 10);
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
        Schema::dropIfExists('purchases');
    }
};
