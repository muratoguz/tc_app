<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Nette\Utils\DateTime;

class Purchase extends Model
{
    use HasFactory;
    protected $table = 'purchases';
    //statuses
    public const Started = 'started';
    public const Renewed = 'renewed';
    public const Cancelled = 'cancelled';
    public const Pending = 'pending';

    //statuses for callback
    public const Waiting = 'waiting';
    public const Done = 'done';
    public const SendAgain = 'send-again';
    protected $fillable = [
        'u_id',
        'app_id',
        'receipt',
        'status',
        'expire_date',
        'os_validation_url',
        'is_active',
    ];

}
