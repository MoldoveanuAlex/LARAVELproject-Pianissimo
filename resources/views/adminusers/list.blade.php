@extends('layouts.app')
@section('content')
@if ($message = Session::get('success'))
<div class="alert alert-success">
<p>{{ $message }}</p>
</div>
@endif
<div class="panel panel-default">
<div class="panel-heading"> 
Lista Clientilor
</div>
<div class="panel-body">
<div class="form-group">
<div class="pull-right">
<a href="/adminusers/create" class="btn btn-default">Adaugare
client nou</a>
</div>
</div>
<table class="table table-bordered table-stripped">
<tr>
<th width="20">No</th>
<th>Nume</th>
<th>Email</th>
<th>Parola</th>
<th width="300">Actiune</th>
</tr>
@if (count($users) > 0)
@foreach ($users as $key => $user)
<tr>
<td>{{ ++$i }}</td>
<td>{{ $user->name }}</td>
<td>{{ $user->email }}</td>
<td>{{ $user->password }}</td>

<td>
<a class="btn btn-success" href="{{
route('adminusers.show',$user->id) }}">Vizualizare</a>
<a class="btn btn-primary" href="{{
route('adminusers.edit',$user->id) }}">Modificare</a>
{{ Form::open(['method' => 'DELETE','route' =>
['adminusers.destroy', $user->id],'style'=>'display:inline']) }}
{{ Form::submit('Delete', ['class' => 'btn btn-
danger']) }}
{{ Form::close() }}
</td>
</tr>
@endforeach
@else
<tr>
<td colspan="4">Nu exista sarcini!</td>
</tr>
@endif
</table>
<!-- Introduce nr pagina -->
{{$users->render()}}
</div>
</div>
@endsection