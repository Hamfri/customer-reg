<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccountInformation extends Model
{
    use HasFactory;

    /**
     * Table assosiated with the model
     * 
     * @var string
     */
    protected $table = 'customers';
    /**
     * Attributes that are mass assignable
     * 
     * @var array
     */
    protected $fillable = [
        'customer_id',
        'account_owner',
        'iban',
        'customer_id'
    ];
}
