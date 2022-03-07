<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeviceToApp extends Model
{
    use HasFactory;

    protected $table = 'device_to_app';
    protected $fillable = [
        'u_id',
        'app_id',
    ];

    public $timestamps = false;
}
