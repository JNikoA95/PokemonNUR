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

    public static int getUsuarioPokemonAtaque(string nick, string pass)
    {
        UserDSTableAdapters.PokemonByUserTableAdapter adapter = new UserDSTableAdapters.PokemonByUserTableAdapter();
        UserDS.PokemonByUserDataTable table = adapter.GetDataPokemonUser(nick, pass);
        string s = table.ElementAt(0).nombre;
        int idPoke = 0;

        if (s.Equals("Charmander"))
        {
            idPoke = 1;
        }

        if (s.Equals("Bulbasaur"))
        {
            idPoke = 2;
        }

        if (s.Equals("Squirtle"))
        {
            idPoke = 3;
        }

        PokemonAtaqueDSTableAdapters.pokemonAtaqueByUsuarioTableAdapter adap = new PokemonAtaqueDSTableAdapters.pokemonAtaqueByUsuarioTableAdapter();
        PokemonAtaqueDS.pokemonAtaqueByUsuarioDataTable tabla = adap.GetAtaquesByPokemonUsuario(Seguridad.GetUserInSession().Codigo_id, idPoke);
        
        
            int? total = 0;
        
        if(tabla.Rows.Count > 0) {
            total = idPoke;
        }

        return total.Value;
    }

    public static void update_dinero(int pokemonUserId, int cantExperiencia)
    {
        PokemonUsuarioDSTableAdapters.PokemonUsuarioTableAdapter adapter = new PokemonUsuarioDSTableAdapters.PokemonUsuarioTableAdapter();
        adapter.update_dinero(pokemonUserId, cantExperiencia);
    }

    public static void update_experiencia(int pokemonUserId, int cantExperiencia)
    {
        PokemonUsuarioDSTableAdapters.PokemonUsuarioTableAdapter adapter = new PokemonUsuarioDSTableAdapters.PokemonUsuarioTableAdapter();
        adapter.upd_experiencia(pokemonUserId, cantExperiencia);
    }

    public static PokemonUsuario getPokemonUsuarioByID(int pokemon_id, int user_id)
    {
        PokemonUsuarioDSTableAdapters.PokemonUsuarioTableAdapter adapter = new PokemonUsuarioDSTableAdapters.PokemonUsuarioTableAdapter();
        PokemonUsuarioDS.PokemonUsuarioDataTable table = adapter.get_pokemonByUsuario(pokemon_id, user_id);

        List<PokemonUsuario> poke = new List<PokemonUsuario>();

        foreach (PokemonUsuarioDS.PokemonUsuarioRow row in table)
        {
            PokemonUsuario obj = new PokemonUsuario
            {
                usuario_id = row.user_id,
                pokemon_id = row.pokemon_id,
                idPokeUser = row.idPkUser,
                experiencia = row.experiencia,
                vida = row.vida
                
            };
            poke.Add(obj);
        }

        PokemonUsuario pokemon = poke[0];

        return pokemon;
    }

}