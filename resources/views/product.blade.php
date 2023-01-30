<!@extends('layouts.app')


@section('title', 'Products')

@section('content')

    

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
    <body>
        <div class="container">
        <p style="padding:15px;">
        	<div class="row">
               <div class="col-xs-4 item-photo">
                    <img style="max-width:100%;" src="{{$product->photo}}" />
                </div>
                <div class="col-xs-5" style="border:0px solid gray">
                    <!-- Datos del vendedor y titulo del producto -->
                    <h3>{{ $product->name }}</h3>    
                    <!-- Precios -->
                    <h5 class="title-price"><small>PRET</small></h5>
                    <h3 style="margin-top:0px;">{{ $product->price }}RON</h3>
                    <h5 class="title-price"><small>Pret cu TVA</small></h5>

        
                    <!-- Detalles especificos del producto -->
                    
                    <div class="section" style="padding-bottom:20px;">
                        <h5 class="title-attr"><small>Cantitate</small></5>                    
                        <div>
                            <input value="1" />
                        </div>
                    </div>                
        
                    <!-- Botones de compra -->
                    <div class="section" style="padding-bottom:30px;">                  
                        <p class="btn-holder" style="margin-right:230px" ><a href="{{ url('add-to-cart/'.$product->id) }}" class="btn btn-warning
                                     btn-block text-center fa fa-shopping-cart" role="button" style="lengh:20px;">Adauga in cos</a> </p>

                        
                    </div>                                        
                </div>                              
        
                <div class="col-xs-9">
                    
                    <div style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
                            <small>
                            <p>{{$product->description}}</p> 
                            <p style="padding:15px;">
                            </small>
                        </p>
                       
                    </div>
                </div>		
            </div>
        </div>        
    </body>
    
</html>
@endsection