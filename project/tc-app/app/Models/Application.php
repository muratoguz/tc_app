<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    use HasFactory;
    protected $table = 'applications';
    protected $fillable = [
        'os_id',
        'app_name',
        'user_name',
        'password',
        'is_active',
    ];

    //public string $redisPrefix = 'app_';
}
