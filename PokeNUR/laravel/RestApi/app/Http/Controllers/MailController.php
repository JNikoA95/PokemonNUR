<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Mail;
use App\Mail\Reminder;
use Session;
use Redirect;

class MailController extends Controller
{
    //

	public function index(){
		return 'ESTE ES EL INDEX';
	}

    public function store(Request $request){

        //$data = array(
        //    'name' =>"Correo Prueba",
        //    'email' => $request->email,

//        );

  //      Mail::send('emails.welcome', $data, function($message){

  //          $message->from('pokenur2017@gmail.com', 'PokeNUR');

  //          $message->to('ass.alejandra@gmail.com')->subject('Email con Laravel');
  //      });
  //      return response()->json($data['email']);

    $mail = $request->email;

    Mail::to($mail)->send(new Reminder);
    }
}
