@extends('layouts.app')
@section('content')
<div class="panel panel-default">
    <div class="panel-heading"> Modificare informatii Sarcina</div>
    <div class="panel-body">
        <!—exista inregistrari in tabelul product  @if (count($errors)> 0)
            <div class="alert alert-danger">
                <strong>Eroare:</strong>
                <ul>
                    @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif
            <!—populez campurile formularului cu datele aferente din tabela product -->
                {!! Form::model($product, ['method' => 'PATCH','route' =>
                ['adminproducts.update', $product->id]]) !!}
                <div class="form-group">
                    <label for="name">Nume</label>
                    <input type="text" name="name" class="form-control" value="{{$product->name }}">
                </div>
                <div class="form-group">
                    <label for="description">Descriere</label>
                    <textarea name="description" class="form-control" rows="3">{{ $product->description }}</textarea>
                </div>
                <div class="form-group">
                    <label for="price">Pret`</label>
                    <textarea name="price" class="form-control" rows="3">{{ $product->price}}</textarea>
                </div>
                <div class="form-group">
                    <label for="photo">Poza de afisare</label>
                    <textarea name="photo" class="form-control" rows="3">{{ $product->Photo}}</textarea>
                </div>
                <div class="form-group">
                    <input type="submit" value="Salvare Modificari" class="btn
btn-info">
                    <a href="{{route('adminproducts.index') }}" class="btn btn-
default">Cancel</a>
                </div>
                {!! Form::close() !!}
    </div>
</div>
@endsection