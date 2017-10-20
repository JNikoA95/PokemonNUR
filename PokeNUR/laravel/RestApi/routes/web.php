<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

	Route::get('registrar', 'RegisterController@getRegister');
	Route::post('registrar', 'RegisterController@postRegister');

	Route::get('usuario', 'AuthenticateController@index');
	Route::post('iniciarSesion', 'AuthenticateController@authenticate');
	
	Route::get('seleccionarPokemon', 'SeleccionController@index');
	Route::post('seleccionarPokemon', 'SeleccionController@Seleccionar');

