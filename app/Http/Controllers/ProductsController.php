<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Cart;
use App\Models\CartProduct;
use App\Models\Product;
use App\Models\User;

class ProductsController extends Controller
{
    public function index()
    {
        $products = Product::all();
        return view('products', compact('products'));
    }
    public function cart()
    {
        return view('cart');
    }
    public function addToCart($id){
        $userId = Auth::id();
        $product = Product::find($id);
        if(!$product) {
            abort(404);
        }

        $quantity = 1;
        $cartModel = Cart::where('user_id', $userId)->first();
        $cart = session()->get('cart') ?? [];

        if(isset($cart[$id])) {
            $quantity = ++$cart[$id]['quantity'];
        }

        if (!$cartModel) {
            $cartModel = Cart::create(['user_id' => $userId]);
        }

        $cardProduct = CartProduct::where('cart_id', $cartModel->id)->where('product_id', $product->id)->first();
        if ($cardProduct) {
            $cardProduct->quantity = $quantity;
            $cardProduct->save();
        } else {
            $cartProduct = CartProduct::create(['cart_id' => $cartModel->id, 'product_id' => $id, 'quantity' => $quantity]);
        }

        $cart[$id] = [
            "name" => $product->name,
            "quantity" => $quantity,
            "price" => $product->price,
            "photo" => $product->photo
        ];
        
        session()->put('cart', $cart);

        return redirect()->back()->with('success', 'Product adaugat cu succesin cos!');
    }

    public function update(Request $request){
        $userId = Auth::id();
        $cartModel = Cart::where('user_id', $userId)->first();
        $productId = $request->id;
        $quantity = $request->quantity;

        if($productId && $quantity){
            if (!$cartModel) {
                $cartModel = Cart::create(['user_id' => $userId]);
            }
    
            $cardProduct = CartProduct::where('cart_id', $cartModel->id)->where('product_id', $productId)->first();
            if ($cardProduct) {
                $cardProduct->quantity = $quantity;
                $cardProduct->save();
            } else {
                $cartProduct = CartProduct::create(['cart_id' => $cartModel->id, 'product_id' => $productId, 'quantity' => $quantity]);
            }

            $cart = session()->get('cart');
            $cart[$productId]["quantity"] = $quantity;
                session()->put('cart', $cart);
                session()->flash('success', 'Cos modificat cu succes');
            }
    }

    public function remove(Request $request){
        $productId = $request->id;
        $userId = Auth::id();
        $cartModel = Cart::where('user_id', $userId)->first();
      
        if($productId) {
            if ($cartModel) {
                CartProduct::where('cart_id', $cartModel->id)->where('product_id', $productId)->delete();
            }

            $cart = session()->get('cart');
            if(isset($cart[$productId])) {
                unset($cart[$productId]);
                session()->put('cart', $cart);
            }
            
        session()->flash('success', 'Product sters cu succes!');
        }
    }

    public function deleteCart(Request $request){
        $userId = Auth::id();
        $cartModel = Cart::where('user_id', $userId)->first();
        if ($cartModel) {
            $cartModel->user_id = NULL;
            $cartModel->save();
        }

        session()->put('cart', []);
        session()->flash('success', 'Product sters cu succes!');

    }

    public function details(Request $request, $id){
        $product = Product::find($id);

        if (!$product) {
            return "Produsul nu exista.";
        }

        return view('product', compact('product'));
    }

    public function order(){
        $userId = Auth::id();
        $cartModel = Cart::where('user_id', $userId)->first();

        if ($cartModel) {
            $cartModel->user_id = NULL;
            $cartModel->status = 1;
            $cartModel->save();
        }

        session()->put('cart', []);
        
        return view('orders');
    }

}
