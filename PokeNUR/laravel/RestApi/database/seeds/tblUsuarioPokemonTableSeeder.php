<?php

use Illuminate\Database\Seeder;

class tblUsuarioPokemonTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
		DB::table('tblusuariopokemon')->insert([
			'usuario_id'=> '',
			'pokemon_id'=> '',
		]);
    }
}
