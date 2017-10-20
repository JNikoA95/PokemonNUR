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
			'nombre'=> 'ascuas',
			'tipo_id'=> '1',
			'daño'=> '40',
		]);

        DB::table('tblataques')->insert([
            'nombre'=> 'llamarada',
            'tipo_id'=> '1',
            'daño'=> '80',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'giro fuego',
            'tipo_id'=> '1',
            'daño'=> '80',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'v de fuego',
            'tipo_id'=> '1',
            'daño'=> '90',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'buceo',
            'tipo_id'=> '2',
            'daño'=> '40',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'burbujas',
            'tipo_id'=> '2',
            'daño'=> '60',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'hidrobomba',
            'tipo_id'=> '2',
            'daño'=> '90',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'surf',
            'tipo_id'=> '2',
            'daño'=> '80',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'hojas navajas',
            'tipo_id'=> '3',
            'daño'=> '80',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'latigo sepa',
            'tipo_id'=> '3',
            'daño'=> '40',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'rayo solar',
            'tipo_id'=> '3',
            'daño'=> '90',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'semillas drenadoras',
            'tipo_id'=> '3',
            'daño'=> '40',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'impac trueno',
            'tipo_id'=> '4',
            'daño'=> '40',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'atack trueno',
            'tipo_id'=> '4',
            'daño'=> '60',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'trueno',
            'tipo_id'=> '4',
            'daño'=> '80',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'tacleada de voltios',
            'tipo_id'=> '3',
            'daño'=> '90',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'ataque arena',
            'tipo_id'=> '5',
            'daño'=> '20',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'excavar',
            'tipo_id'=> '5',
            'daño'=> '70',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'fisura',
            'tipo_id'=> '5',
            'daño'=> '90',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'terremoto',
            'tipo_id'=> '5',
            'daño'=> '80',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'vuelo',
            'tipo_id'=> '6',
            'daño'=> '60',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'golpe aereo',
            'tipo_id'=> '6',
            'daño'=> '40',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'ataque de ala',
            'tipo_id'=> '6',
            'daño'=> '60',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'tornado',
            'tipo_id'=> '6',
            'daño'=> '60',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'hipnosis',
            'tipo_id'=> '7',
            'daño'=> '0',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'rayo psiquico',
            'tipo_id'=> '7',
            'daño'=> '80',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'come sueños',
            'tipo_id'=> '7',
            'daño'=> '100',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'confusion',
            'tipo_id'=> '7',
            'daño'=> '70',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'bola de sombras',
            'tipo_id'=> '8',
            'daño'=> '70',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'lenguetazo',
            'tipo_id'=> '8',
            'daño'=> '30',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'puño de sombras',
            'tipo_id'=> '8',
            'daño'=> '70',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'tinieblas',
            'tipo_id'=> '8',
            'daño'=> '80',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'polvo venenoso',
            'tipo_id'=> '9',
            'daño'=> '30',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'aguijon',
            'tipo_id'=> '9',
            'daño'=> '50',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'guadaña venenosa',
            'tipo_id'=> '9',
            'daño'=> '70',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'chupavidas',
            'tipo_id'=> '9',
            'daño'=> '50',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'golpe furia',
            'tipo_id'=> '10',
            'daño'=> '20',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'embestida',
            'tipo_id'=> '10',
            'daño'=> '50',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'movimiento sismico',
            'tipo_id'=> '10',
            'daño'=> '60',
        ]);

        DB::table('tblataques')->insert([
            'nombre'=> 'placaje',
            'tipo_id'=> '10',
            'daño'=> '40',
        ]);
    }
}
