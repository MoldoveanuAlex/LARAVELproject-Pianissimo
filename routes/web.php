<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\UserAccess;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Auth::routes();
Route::redirect('/', '/products');
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::redirect('/home', '/products');
Route::group(['middleware' => 'auth'], function () {

    // Route::get('/', 'App\Http\Controllers\TaskController@index');
    // Route::resource('tasks', 'App\Http\Controllers\TaskController');
    // Route::patch('update-cart', 'ProductsController@update');
    // Route::delete('remove-from-cart', 'ProductsController@remove');



    Route::get('/products', 'App\Http\Controllers\ProductsController@index'); //afisare pagina de start
    Route::get('/cart', 'App\Http\Controllers\ProductsController@cart'); //cos
    Route::get('/orders', 'App\Http\Controllers\ProductsController@order'); //cos
    Route::get('/add-to-cart/{id}', 'App\Http\Controllers\ProductsController@addToCart'); //adaug incos
    Route::patch('/update-cart', 'App\Http\Controllers\ProductsController@update'); //modific cos
    Route::delete('/remove-from-cart', 'App\Http\Controllers\ProductsController@remove');
    Route::delete('/delete-cart', 'App\Http\Controllers\ProductsController@deleteCart');
    Route::get('/products/{id}', 'App\Http\Controllers\ProductsController@details');
});

Route::middleware(['auth', 'user-access:admin'])->group(function () {

    Route::get('/adminproducts', 'App\Http\Controllers\AdminProductController@index'); //afisare lista sarcini pe pagina de start
    Route::resource('adminproducts', 'App\Http\Controllers\AdminProductController'); // Ruta de resurse va genera CRUD URI
    Route::get('/adminusers', 'App\Http\Controllers\AdminUserController@index');
    Route::resource('/adminusers', 'App\Http\Controllers\AdminUserController');
});