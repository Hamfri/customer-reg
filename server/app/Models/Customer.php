<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;



 /**
 * @OA\Schema(
 * @OA\Xml(name="Customer"),
 * type="object",
 * required={"first_name","last_name","telephone","street","house_number","zip_code","city"},
 * ),
 * @OA\Property(property="first_name", type="string", description="Firstname", example="John"),
 * @OA\Property(property="last_name", type="string", description="Lastname", example="Doe"),
 * @OA\Property(property="telephone", type="string", description="Telephone", example="017255860000"),
 * @OA\Property(property="street", type="string", description="Street", example="Clara Zetkin Str 107"),
 * @OA\Property(property="house_number", type="string", description="House number", example="WE09"),
 * @OA\Property(property="zip_code", type="string", description="Zipcode", example="99099"),
 * @OA\Property(property="city", type="string", description="city", example="Erfurt"),
 */
class Customer extends Model
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
        'house_number',
        'zip_code',
        'city'
    ];

    /**
     * Relationships
     */
    public function customer()
    {
        return $this->hasOne('App\Models\Customer');
    }
}
