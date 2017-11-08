using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de PokemonBRL
/// </summary>
public class PokemonBRL
{
    public PokemonBRL()
    {}

    public static List<Pokemon> getPokemones(int id)
    {
        PokemonDSTableAdapters.PokemonByUsuarioIdTableAdapter adapter = new PokemonDSTableAdapters.PokemonByUsuarioIdTableAdapter();
        PokemonDS.PokemonByUsuarioIdDataTable table = adapter.GetPokemonByUsuarioId(id);
        List<Pokemon> lista= new List<Pokemon>();

        foreach (PokemonDS.PokemonByUsuarioIdRow row in table)
        {
            lista.Add(RowToDto(row));
        }

        return lista;
    }

    private static Pokemon RowToDto(PokemonDS.PokemonByUsuarioIdRow row)
    {
        Pokemon objPokemon = new Pokemon
        {
            Codigo_id = row.codigo_id,
            Nombre = row.nombre
        };

        return objPokemon;
    }
}