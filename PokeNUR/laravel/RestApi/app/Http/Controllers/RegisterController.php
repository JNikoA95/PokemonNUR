<?php

namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class RegisterController extends Controller
{
    //
	public function getRegister(){
        return 'ESTO ES EL INDEX';
    }
	
	public function postRegister(Request $request)
	{
		
			$user = new User;
			$user->name = $request->name;
			$user->nameUser = $request->nameUser;
			$user->email = $request->email;
			$user->password = bcrypt($request->password);
			
			$user->save();
			return redirect('registrar');
		
	}
}
