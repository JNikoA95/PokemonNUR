<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Mail;
use Session;
use Redirect;

class MailController extends Controller
{
    //

	public function index(){
		return 'ESTE ES EL INDEX';
	}

    public function store(Request $request){
        $data = array(
            'name' =>"Correo Prueba",
        );

        Mail::send('emails.email', $data, function($message){
            $message->from('pokenur2017@gmail.com', 'PokeNUR');

            $message->to($request->email)->subject('Email con Laravel');
        });
    }
}
