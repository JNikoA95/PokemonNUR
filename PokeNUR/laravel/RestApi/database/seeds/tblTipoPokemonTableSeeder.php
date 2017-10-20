<?php

use Illuminate\Database\Seeder;

class tblTipoPokemonTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
		DB::table('tbltipopokemon')->insert([
			'pokemon_id'=> '',
			'tipo_id'=> '',
		]);
    }
}
