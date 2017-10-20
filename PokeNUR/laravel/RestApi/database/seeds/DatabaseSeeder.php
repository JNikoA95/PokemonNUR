<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        $this->call(UsersTableSeeder::class);
		$this->call(tblPokemonesTableSeeder::class);
		$this->call(tblAtaquesTableSeeder::class);
		$this->call(tblPokemonAtaqueTableSeeder::class);
		$this->call(tblTipoTableSeeder::class);
		$this->call(tblTipoAtaqueTableSeeder::class);
		$this->call(tblTipoPokemonTableSeeder::class);
		$this->call(tblUsuarioPokemonTableSeeder::class);
    }
}
