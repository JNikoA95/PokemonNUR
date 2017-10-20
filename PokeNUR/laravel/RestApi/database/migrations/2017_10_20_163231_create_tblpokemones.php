<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblpokemones extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
		Schema::create('tblpokemones', function (Blueprint $table) {
            $table->increments('codigo_id');
            $table->string('nombre');
			$table->integer('nivel');
            $table->integer('experiencia')->default(0);
            $table->integer('puntosVida')->default(20);
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
		Schema::dropIfExists('tblpokemones');
    }
}
