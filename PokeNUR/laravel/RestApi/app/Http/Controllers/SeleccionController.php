<?php

namespace App\Http\Controllers;
use App\tblusuariopokemon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SeleccionController extends Controller
{
    //
	
	public function index(){
        return 'ESTO ES EL INDEX';
    }
	
	public function seleccionar(Request $request)
	{
		
		$nota = new tblusuariopokemon;
        $nota->usuario_id = $request->usuario_id;
        $nota->pokemon_id = $request->pokemon_id;

        $nota->save();
    }
}
