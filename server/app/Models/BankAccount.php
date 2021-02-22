<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


/**
 * @OA\Schema(
 * @OA\Xml(name="BankAccount"),
 * type="object",
 * required={"customer_id","account_owner","iban"},
 * ),
 * @OA\Property(property="customer_id", type="integer", description="Customer id", example="1"),
 * @OA\Property(property="account_owner", type="string", description="Account owner's name", example="John Doe"),
 * @OA\Property(property="iban", type="string", description="IBAN", example="DE75512108001245126188"),
 */
class BankAccount extends Model
{
    use HasFactory;

    /**
     * Table assosiated with the model
     * 
     * @var string
     */
    protected $table = 'bank_accounts';
    /**
     * Attributes that are mass assignable
     * 
     * @var array
     */
    protected $fillable = [
        'customer_id',
        'account_owner',
        'iban'
    ];

    /**
     * Relationships
     */
    public function customer()
    {
        return $this->belongsTo('App\Models\Customer');
    }
}
