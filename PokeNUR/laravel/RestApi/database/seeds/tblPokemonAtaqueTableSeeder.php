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
			'pokemon_id'=> '1',
			'ataque_id'=> '1',
		]);0
	DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '1',
			'ataque_id'=> '2',
		]);

	DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '1',
			'ataque_id'=> '41',
		]);
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '1',
			'ataque_id'=> '39',
		]);
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '2',
			'ataque_id'=> '6',
		]);
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '2',
			'ataque_id'=> '7',
		]);
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '2',
			'ataque_id'=> '38',
		]);
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '2',
			'ataque_id'=> '41',
		]);
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '3',
			'ataque_id'=> '9',
		]);
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '3',
			'ataque_id'=> '12',
		]);
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '3',
			'ataque_id'=> '11',
		]);
		DB::table('tblpokemonataque')->insert([
			'pokemon_id'=> '3',
			'ataque_id'=> '41',
		]);

    }
}
