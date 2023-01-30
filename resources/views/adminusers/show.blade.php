@extends('layouts.app')
@section('content')
<div class="panel panel-default">
<div class="panel-heading">
View user
</div>
<div class="panel-body">
<div class="pull-right">
<a class="btn btn-default" href="{{ route('adminusers.index')
}}">Inapoi</a>
</div>
<div class="form-group">
<strong>Nume: </strong> {{ $user->name }}
</div>
<div class="form-group">
<strong>Email: </strong> {{ $user->email }}
</div>
<div>
<strong>Parola: </strong> {{ $user->password }}
</div>
</div>
</div>
</div>
@endsection