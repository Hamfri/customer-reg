<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customers extends Model
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
        'first_name',
        'last_name',
        'telephone',
        'street',
        'zip_code',
        'city'
    ];
}
