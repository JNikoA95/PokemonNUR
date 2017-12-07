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

    public static List<Ataque> getAtaquesByPokemon(int pokemon_id, int usuario_id)
    {
        List<Ataque> lista = new List<Ataque>();
        PokemonAtaqueDSTableAdapters.pokemonAtaqueByUsuarioTableAdapter adapter = new PokemonAtaqueDSTableAdapters.pokemonAtaqueByUsuarioTableAdapter();
        PokemonAtaqueDS.pokemonAtaqueByUsuarioDataTable table = adapter.GetAtaquesByPokemonUsuario(usuario_id, pokemon_id);

        foreach (PokemonAtaqueDS.pokemonAtaqueByUsuarioRow row in table)
        {
            lista.Add(new Ataque
            {
                Nombre = row.nombre,
                Codigo_id = row.codigo_id,
                PoderAtaque = row.poderAtaque,
                Tipo_id = row.tipo_id
            });
        }
        return lista;
    }
}