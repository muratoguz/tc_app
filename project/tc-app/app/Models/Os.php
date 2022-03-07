<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Os extends Model
{
    use HasFactory;
    protected $table = 'operating_systems';
    protected $fillable = [
        'name',
        'support',
        'validation_url',
        'is_active',
    ];

    //public string $redisPrefix = "os_";
}
