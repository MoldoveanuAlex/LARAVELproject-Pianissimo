@extends('layouts.app')
@section('title', 'Products')
@section('content')
<div class="container products">
    <div class="row">
        @foreach($products as $product)
        <div class="col-xs-18 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="{{    $product->photo    }}" width="500" height="300" style="display: flex; justify-content: center; position:relative; width: 100%;
  height: auto;">
                <div class="caption">
                    <h4>
                    <a href="{{url('products/'.$product->id)}}">{{ $product->name }} </a>
                    </h4>
                    
                    <p><strong>Pret: </strong> {{ $product->price }}$</p>
                    <p class="btn-holder">
                        <a href="{{url('add-to-cart/'.$product->id)}}" 
                        class="btn  btn-warning  btn-block  text-center" 
                        role="button">Pune in cos</a> 
                    </p>
                </div>
            </div>
        </div>
        @endforeach</div>
</div>
@endsection
-

