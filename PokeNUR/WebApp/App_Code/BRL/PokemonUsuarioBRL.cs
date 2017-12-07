using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de UsuarioBRL
/// </summary>
public class PokemonUsuarioBRL
{
    public PokemonUsuarioBRL()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public static void insrtUsuarioPokemon(int idUsuario, int idPokemon)
    {
        UserDSTableAdapters.UsuariosTableAdapter adapter = new UserDSTableAdapters.UsuariosTableAdapter();
        adapter.mk_tblPokemonUsuario(idUsuario, idPokemon);
    }

    public static int getUsuarioPokemon(string nick, string pass)
    {
        UserDSTableAdapters.PokemonByUserTableAdapter adapter = new UserDSTableAdapters.PokemonByUserTableAdapter();
        UserDS.PokemonByUserDataTable table = adapter.GetDataPokemonUser(nick, pass);
        
        int? total = table.Rows.Count;

        return total.Value;
    }

    public static void update_dinero(int pokemonUserId, int cantExperiencia)
    {
        PokemonUsuarioTableAdapters.PokemonUsuarioTableAdapter adapter = new PokemonUsuarioTableAdapters.PokemonUsuarioTableAdapter();
        adapter.update_dinero(pokemonUserId, cantExperiencia);
    }

    public static void update_experiencia(int pokemonUserId, int cantExperiencia)
    {
        PokemonUsuarioTableAdapters.PokemonUsuarioTableAdapter adapter = new PokemonUsuarioTableAdapters.PokemonUsuarioTableAdapter();
        adapter.update_experiencia(pokemonUserId, cantExperiencia);
    }
}