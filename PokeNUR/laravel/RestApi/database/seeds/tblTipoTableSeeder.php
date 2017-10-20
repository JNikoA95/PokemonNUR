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
            'nombretipo'=> 'fuego'
		]);

        DB::table('tbltipo')->insert([
            'nombretipo'=> 'agua'
        ]);

        DB::table('tbltipo')->insert([
            'nombretipo'=> 'planta'
        ]);

        DB::table('tbltipo')->insert([
            'nombretipo'=> 'electrico'
        ]);

        DB::table('tbltipo')->insert([
            'nombretipo'=> 'tierra'
        ]);

        DB::table('tbltipo')->insert([
            'nombretipo'=> 'aire'
        ]);

        DB::table('tbltipo')->insert([
            'nombretipo'=> 'psiquico'
        ]);

        DB::table('tbltipo')->insert([
            'nombretipo'=> 'fantasma'
        ]);

        DB::table('tbltipo')->insert([
            'nombretipo'=> 'bicho'
        ]);

        DB::table('tbltipo')->insert([
            'nombretipo'=> 'normal'
        ]);

    }
}
