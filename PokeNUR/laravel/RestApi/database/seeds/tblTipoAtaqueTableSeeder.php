<?php

use Illuminate\Database\Seeder;

class tblTipoAtaqueTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
		DB::table('tbltipoataque')->insert([
			'ataque_id'=> '',
			'tipo_id'=> '',
		]);
    }
}
