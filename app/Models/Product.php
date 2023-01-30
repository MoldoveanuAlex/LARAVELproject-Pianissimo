<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public $fillable = ['id','name', 'description',"photo","price"];

    public function carts()
    {
        return $this->belongsToMany(Cart::class, 'cart_products', 'product_id', 'cart_id');
    }
}
