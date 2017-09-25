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

    
}