@extends('layouts.app')
@section('content')
<div class="panel panel-default">
<div class="panel-heading"> Modificare informatii Sarcina</div>
<div class="panel-body">
<!—exista inregistrari in tabelul user 
@if (count($errors) > 0)
<div class="alert alert-danger">
<strong>Eroare:</strong>
<ul>
@foreach ($errors->all() as $error)
<li>{{ $error }}</li>
@endforeach
</ul>
</div>
@endif
<!—populez campurile formularului cu datele aferente din tabela user -->
{!! Form::model($user, ['method' => 'PATCH','route' =>
['adminusers.update', $user->id]]) !!}
<div class="form-group">
<label for="name">Nume</label>
<input type="text" name="name" class="form-control"
value="{{$user->name }}">
</div>
<div class="form-group">
<label for="email">Email</label>
<textarea name="email" class="form-control"
rows="3">{{ $user->email}}</textarea>
</div>
<div class="form-group">
<label for="password">Parola</label>
<textarea name="password" class="form-control"
rows="3">{{ $user->password}}</textarea>
</div>
<div class="form-group">
<input type="submit" value="Salvare Modificari" class="btn
btn-info">
<a href="{{route('adminusers.index') }}" class="btn btn-
default">Cancel</a>
</div>
{!! Form::close() !!}
</div>
</div>
@endsection