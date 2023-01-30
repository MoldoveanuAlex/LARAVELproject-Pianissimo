<!@extends('layouts.app') @section('title', 'Orders' ) @section('content') <!DOCTYPE html>
    <html>

    <head>
        <style>
            .order-style {
                padding: 15px;
                text-align: center
            }
        </style>

    </head>
    <div class="order-style" padding: 10px>
        <h2>Comanda plasata cu success!</h2>
        <br>
        <p style="padding:5px;"></p>
        <a a href="{{ url('/products') }}" class="btn btn-warning"><i class="fa
        fa-angle-left"></i>Reveniti la magazin</a> 
        </div>

    </html>
    <p style="padding:90px;">
        @endsection