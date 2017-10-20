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
			'pokemon_id'=> '1',
			'tipo_id'=> '1',
		]);

        DB::table('tbltipopokemon')->insert([
            'pokemon_id'=> '2',
            'tipo_id'=> '2',
        ]);

        DB::table('tbltipopokemon')->insert([
            'pokemon_id'=> '3',
            'tipo_id'=> '3',
        ]);
    }
}
