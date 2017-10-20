<?php

use Illuminate\Database\Seeder;

class tblAtaquesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
		DB::table('tblataques')->insert([
			'nombre'=> '',
			'tipo_id'=> '',
			'daño'=> '',
		]);
    }
}
