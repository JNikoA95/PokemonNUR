using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Batallas : System.Web.UI.Page
{
    int pokemonActual_id = 3;
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Pokemon> listaPokemones = (List<Pokemon>)Session["pokemonesLista"];
        List<Ataque> listaAtaques1 = new List<Ataque>();
        List<Ataque> listaAtaques2 = new List<Ataque>();
        List<Ataque> listaAtaques3 = new List<Ataque>();

        if (listaPokemones.Count == 1)
        {
            listaAtaques1 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
        }

        if (listaPokemones.Count == 2)
        {
            listaAtaques1 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            listaAtaques2 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[1].Codigo_id, Seguridad.GetUserInSession().Codigo_id);

            if (listaPokemones[1].Codigo_id == pokemonActual_id)
            {
                Ataque1.Value = listaAtaques2[0].Nombre;
                Ataque2.Value = listaAtaques2[1].Nombre;
                Ataque3.Value = listaAtaques2[2].Nombre;
                Ataque4.Value = listaAtaques2[3].Nombre;
            }
        }

        if (listaPokemones.Count == 3)
        {
            listaAtaques1 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            listaAtaques2 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[1].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            listaAtaques3 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[2].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
        }

        if (listaPokemones[0].Codigo_id == pokemonActual_id)
        {
            Ataque1.Value = listaAtaques1[0].Nombre;
            Ataque2.Value = listaAtaques1[1].Nombre;
            Ataque3.Value = listaAtaques1[2].Nombre;
            Ataque4.Value = listaAtaques1[3].Nombre;
        }
        if (listaPokemones.Count == 2)
        {
            
        }

        if (listaPokemones.Count == 3)
        {
            if (listaPokemones[2].Codigo_id == pokemonActual_id)
            {
                Ataque1.Value = listaAtaques3[0].Nombre;
                Ataque2.Value = listaAtaques3[1].Nombre;
                Ataque3.Value = listaAtaques3[2].Nombre;
                Ataque4.Value = listaAtaques3[3].Nombre;
            }
        }

    }

    [WebMethod]
    public static bool guardarDetalleBatalla(int batalla_id, int pokemon_id, int ataque_id, int daño)
    {
        DetalleBatalla obj = new DetalleBatalla
        {
            AtaqueID = ataque_id,
            BatallaID = batalla_id,
            Daño = daño,
            JugadorID = Seguridad.GetUserInSession().Codigo_id,
            PokemonID = pokemon_id
        };

        try
        {
            DetalleBatallaBRL.insert(obj);
            return true;
        }
        catch
        {
        }
        return false;
    }
}