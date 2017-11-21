using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class PokemonAtaqueBRL
{
    public PokemonAtaqueBRL()
    {
    }

    public static void insert(PokemonAtaque objPokemonAtaque)
    {
        PokemonAtaqueDSTableAdapters.PokemonAtaquesTableAdapter adapter = new PokemonAtaqueDSTableAdapters.PokemonAtaquesTableAdapter();
        adapter.Insert(objPokemonAtaque.Pokemon_id, objPokemonAtaque.Ataque_id, objPokemonAtaque.Usuario_id);
    }
}