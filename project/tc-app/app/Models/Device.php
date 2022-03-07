<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;

class Device extends Model
{
    use HasFactory, HasApiTokens;

    protected $table = 'devices';

    protected $fillable = [
        'u_id',
        'app_id',
        'lang',
        'os_id',
        'is_active',
    ];

    protected $hidden = [
        'client_token',
    ];

    //public string $redisPrefix = "device_";

}
