<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Requests;

class AdminProductController extends Controller
{
    public function index(Request $request)
    {
    $products = Product::orderBy('name','ASC')->paginate(5);
    $value=($request->input('page',1)-1)*5;
    return view('adminproducts.list',compact('products'))->with('i',$value);
    }
    public function create()
    {
    return view('adminproducts.create');
    }
    public function store(Request $request)
    {
    $this->validate($request, ['name' => 'required','description' =>
    'required']);
    // create new product
    Product::create($request->all());
    return redirect()->route('adminproducts.index')->with('success', 'Your product
    added successfully!');
    }
    public function show($id)
    {
    $product = Product::find($id);
    return view('adminproducts.show',compact('product'));
    }
    public function edit($id)
    {
    $product = Product::find($id);
    return view('adminproducts.edit', compact('product'));
    }
    public function update(Request $request, $id)
    {
    $this->validate($request, [
    'name' => 'required', 'description' => 'required'
    ]);
    Product::find($id)->update($request->all());
    return redirect()->route('adminproducts.index')->with('success','product updated
    successfully');
    }
    public function destroy($id)
    {
    Product::find($id)->delete();
    return redirect()->route('adminproducts.index')->with('success','product
    removed successfully');
    }
    }