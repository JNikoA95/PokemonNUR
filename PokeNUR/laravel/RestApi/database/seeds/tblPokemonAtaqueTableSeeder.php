<?php

use Illuminate\Database\Seeder;

class tblPokemonAtaqueTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '',
			'ataque_id'=> '',
		]);
    }
}
