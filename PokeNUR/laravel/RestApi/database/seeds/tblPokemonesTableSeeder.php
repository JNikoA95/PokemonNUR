<?php

use Illuminate\Database\Seeder;

class tblPokemonesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
		DB::table('tblpokemones')->insert([
			'nombre'=> 'Charmander',
			'nivel'=> '1',
		]);
		
		DB::table('tblpokemones')->insert([
			'nombre'=> 'Squirtle',
			'nivel'=> '1',
		]);
		
		DB::table('tblpokemones')->insert([
			'nombre'=> 'Bulbasaur',
			'nivel'=> '1',
		]);
    }
}
