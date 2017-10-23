<?php

namespace App\Http\Controllers;
use App\tblusuariopokemon;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests;


use Illuminate\Http\Request;

class SeleccionController extends Controller
{
    //
    public function index(){
        return 'ESTO ES EL INDEX';
    }
	
	public function seleccionar(Request $request)
	{
		
		$nota = new tblusuariopokemon;
		$id = Auth::user()->id;
        $nota->usuario_id = $id;
        $nota->pokemon_id = $request->pokemon_id;

        $nota->save();
    }
}
