<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 * @OA\Xml(name="Transaction"),
 * type="object",
 * required={"customer_id","payment_data_id"},
 * ),
 * @OA\Property(property="customer_id", type="integer", description="customer id", example="1"),
 * @OA\Property(property="payment_data_id", type="string", description="Payment data id", example="2bf8fba60f713d698022be772293a35c40af86c7d20ceed202633c79c493b47d311e4cea792ad0af1b73f1757b76f870"),
 */
class Transaction extends Model
{
    use HasFactory;

    /**
     * Table assosiated with the model
     * 
     * @var string
     */
    protected $table = 'transactions';
    /**
     * Attributes that are mass assignable
     * 
     * @var array
     */
    protected $fillable = [
        'customer_id',
        'payment_data_id',
    ];
}
