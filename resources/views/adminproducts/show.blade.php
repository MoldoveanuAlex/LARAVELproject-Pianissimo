@extends('layouts.app')
@section('content')
<div class="panel panel-default">
<div class="panel-heading">
View product
</div>
<div class="panel-body">
<div class="pull-right">
<a class="btn btn-default" href="{{ route('adminproducts.index')
}}">Inapoi</a>
</div>
<div class="form-group">
<strong>Nume: </strong> {{ $product->name }}
</div>
<div class="form-group">
<div><strong>Descriere: </strong> {{ $product->description }}
</div>
<div>
<strong>Pret: </strong> {{ $product->price }}
<div>
    <strong>Poza de afisare: </strong> {{$product->photo}}
</div>    
</div>
</div>
</div>
</div>
@endsection