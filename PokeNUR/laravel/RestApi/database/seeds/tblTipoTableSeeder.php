<?php

use Illuminate\Database\Seeder;

class tblTipoTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
		DB::table('tbltipo')->insert([
			'nombretipo'=> '',
		]);
    }
}
