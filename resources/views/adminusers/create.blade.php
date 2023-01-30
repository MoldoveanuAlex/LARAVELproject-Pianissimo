@extends('layouts.app')
@section('content')
<div class="panel panel-default">
<div class="panel-heading">Adaugă user nou</div>
<div class="panel-body">
@if (count($errors) > 0)
<div class="alert alert-danger">
<strong>Errors:</strong>
<ul>
@foreach ($errors->all() as $error)
<li>{{ $error }}</li>
@endforeach
</ul>
</div>
@endif
{{ Form::open(array('route' => 'adminusers.store','method'=>'POST')) }}
<div class="form-group">
<label for="name">Nume</label>
<input type="text" name="name" class="form-control"
value="{{old('name') }}">
</div>
<div class="form-group">
<label for="email">Email</label>
<textarea name="email" class="form-control"
rows="3">{{old('email') }}</textarea>
</div>
<div class="form-group">
<label for="password">Parola</label>
<textarea name="password" class="form-control"
rows="3">{{old('password') }}</textarea>
</div>
<div class="form-group">
<input type="submit" value="Adauga User" class="btn btn-info">
<a href="{{ route('adminusers.index') }}" class="btn btndefault">Cancel</a>
</div>
{{ Form::close() }}
</div>
</div>
@endsection