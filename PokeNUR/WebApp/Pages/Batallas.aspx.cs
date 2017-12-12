using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Batallas : System.Web.UI.Page
{
    //int pokemonActual_id = 3;
    List<int[]> playerLocal = new List<int[]>();
    List<int[]> playerVisitante = new List<int[]>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        if (!Seguridad.ThereAreUserInSession())
        {
            Response.Redirect("login.aspx");
            return;
        }

        if (PokemonUsuarioBRL.getUsuarioPokemon(Seguridad.GetUserInSession().NickName, Seguridad.GetUserInSession().Password) == 0)
        {
            Response.Redirect("Seleccion.aspx");
        }

        if ((PokemonUsuarioBRL.getUsuarioPokemon(Seguridad.GetUserInSession().NickName, Seguridad.GetUserInSession().Password) > 0) &&
            (PokemonUsuarioBRL.getUsuarioPokemonAtaque(Seguridad.GetUserInSession().Codigo_id, PokemonBRL.getPokemones(Seguridad.GetUserInSession().Codigo_id).ElementAt(0).Codigo_id) <= 0))
        {
            int idPokemon = PokemonBRL.getPokemones(Seguridad.GetUserInSession().Codigo_id).ElementAt(0).Codigo_id;
            Session["idPokemon"] = idPokemon;
            Response.Redirect("SeleccionAtaque.aspx?idPokemon=" + idPokemon);
        }

        string id = Request["id"];
        string pokemon_id = Request["pokemon_id"];

        if (id == null || pokemon_id == null)
            Response.Redirect("Usuario.aspx");

        txtBatalla_id.Value = Session["id"].ToString();
        User1.Value = Seguridad.GetUserInSession().NickName;
        List<Pokemon> listaPokemones = (List<Pokemon>)Session["pokemonesLista"];
        int pokemonActual_id = listaPokemones[0].Codigo_id;
        List<Ataque> listaAtaques1 = new List<Ataque>();
        List<Ataque> listaAtaques2 = new List<Ataque>();
        List<Ataque> listaAtaques3 = new List<Ataque>();
        txtPokemon_id.Value = pokemonActual_id.ToString();

        if (listaPokemones.Count == 1)
        {
            listaAtaques1 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            playerLocal.Add(PokemonDetalles(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id));
        }

        if (listaPokemones.Count == 2)
        {
            listaAtaques1 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            listaAtaques2 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[1].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            playerLocal.Add(PokemonDetalles(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id));
            playerLocal.Add(PokemonDetalles(listaPokemones[1].Codigo_id, Seguridad.GetUserInSession().Codigo_id));
        }

        if (listaPokemones.Count == 3)
        {
            listaAtaques1 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            listaAtaques2 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[1].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            listaAtaques3 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[2].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            playerLocal.Add(PokemonDetalles(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id));
            playerLocal.Add(PokemonDetalles(listaPokemones[1].Codigo_id, Seguridad.GetUserInSession().Codigo_id));
            playerLocal.Add(PokemonDetalles(listaPokemones[2].Codigo_id, Seguridad.GetUserInSession().Codigo_id));
        }



        if (listaPokemones[0].Codigo_id == pokemonActual_id)
        {
            Ataque1.Value = listaAtaques1[0].Nombre;
            txtAtaque1.Value = listaAtaques1[0].Codigo_id.ToString();

            Ataque2.Value = listaAtaques1[1].Nombre;
            txtAtaque2.Value = listaAtaques1[1].Codigo_id.ToString();

            Ataque3.Value = listaAtaques1[2].Nombre;
            txtAtaque3.Value = listaAtaques1[2].Codigo_id.ToString();

            Ataque4.Value = listaAtaques1[3].Nombre;
            txtAtaque4.Value = listaAtaques1[3].Codigo_id.ToString();


            Ataque1.Attributes["onclick"] = "registrar(" + listaAtaques1[0].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[0].PoderAtaque) + ")";
            Ataque2.Attributes["onclick"] = "registrar(" + listaAtaques1[1].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[1].PoderAtaque) + ")";
            Ataque3.Attributes["onclick"] = "registrar(" + listaAtaques1[2].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[2].PoderAtaque) + ")";
            Ataque4.Attributes["onclick"] = "registrar(" + listaAtaques1[3].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[3].PoderAtaque) + ")";

            pokemonLocal.ImageUrl = "../App_Themes/Style/img/" + listaPokemones[0].Nombre + "%20espalda.gif";
        }

        if (listaPokemones.Count == 2)
        {
            if (listaPokemones[0].Codigo_id == pokemonActual_id)
            {
                Ataque1.Value = listaAtaques1[0].Nombre;
                txtAtaque1.Value = listaAtaques1[0].Codigo_id.ToString();

                Ataque2.Value = listaAtaques1[1].Nombre;
                txtAtaque2.Value = listaAtaques1[1].Codigo_id.ToString();

                Ataque3.Value = listaAtaques1[2].Nombre;
                txtAtaque3.Value = listaAtaques1[2].Codigo_id.ToString();

                Ataque4.Value = listaAtaques1[3].Nombre;
                txtAtaque4.Value = listaAtaques1[3].Codigo_id.ToString();


                Ataque1.Attributes["onclick"] = "registrar(" + listaAtaques1[0].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[0].PoderAtaque) + ")";
                Ataque2.Attributes["onclick"] = "registrar(" + listaAtaques1[1].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[1].PoderAtaque) + ")";
                Ataque3.Attributes["onclick"] = "registrar(" + listaAtaques1[2].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[2].PoderAtaque) + ")";
                Ataque4.Attributes["onclick"] = "registrar(" + listaAtaques1[3].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[3].PoderAtaque) + ")";

                pokemonLocal.ImageUrl = "../App_Themes/Style/img/" + listaPokemones[0].Nombre + "%20espalda.gif";
            }

            if (listaPokemones[1].Codigo_id == pokemonActual_id)
            {
                Ataque1.Value = listaAtaques2[0].Nombre;
                txtAtaque1.Value = listaAtaques2[0].Codigo_id.ToString();

                Ataque2.Value = listaAtaques2[1].Nombre;
                txtAtaque2.Value = listaAtaques2[1].Codigo_id.ToString();

                Ataque3.Value = listaAtaques2[2].Nombre;
                txtAtaque3.Value = listaAtaques2[2].Codigo_id.ToString();

                Ataque4.Value = listaAtaques2[3].Nombre;
                txtAtaque4.Value = listaAtaques2[3].Codigo_id.ToString();


                Ataque1.Attributes["onclick"] = "registrar(" + listaAtaques2[0].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques2[0].PoderAtaque) + ")";
                Ataque2.Attributes["onclick"] = "registrar(" + listaAtaques2[1].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques2[1].PoderAtaque) + ")";
                Ataque3.Attributes["onclick"] = "registrar(" + listaAtaques2[2].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques2[2].PoderAtaque) + ")";
                Ataque4.Attributes["onclick"] = "registrar(" + listaAtaques2[3].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques2[3].PoderAtaque) + ")";
                pokemonLocal.ImageUrl = "../App_Themes/Style/img/" + listaPokemones[1].Nombre + "%20espalda.gif";
            }
        }

        if (listaPokemones.Count == 3)
        {
            if (listaPokemones[0].Codigo_id == pokemonActual_id)
            {
                Ataque1.Value = listaAtaques1[0].Nombre;
                txtAtaque1.Value = listaAtaques1[0].Codigo_id.ToString();

                Ataque2.Value = listaAtaques1[1].Nombre;
                txtAtaque2.Value = listaAtaques1[1].Codigo_id.ToString();

                Ataque3.Value = listaAtaques1[2].Nombre;
                txtAtaque3.Value = listaAtaques1[2].Codigo_id.ToString();

                Ataque4.Value = listaAtaques1[3].Nombre;
                txtAtaque4.Value = listaAtaques1[3].Codigo_id.ToString();


                Ataque1.Attributes["onclick"] = "registrar(" + listaAtaques1[0].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[0].PoderAtaque) + ")";
                Ataque2.Attributes["onclick"] = "registrar(" + listaAtaques1[1].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[1].PoderAtaque) + ")";
                Ataque3.Attributes["onclick"] = "registrar(" + listaAtaques1[2].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[2].PoderAtaque) + ")";
                Ataque4.Attributes["onclick"] = "registrar(" + listaAtaques1[3].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques1[3].PoderAtaque) + ")";

                pokemonLocal.ImageUrl = "../App_Themes/Style/img/" + listaPokemones[0].Nombre + "%20espalda.gif";
            }

            if (listaPokemones[1].Codigo_id == pokemonActual_id)
            {
                Ataque1.Value = listaAtaques2[0].Nombre;
                txtAtaque1.Value = listaAtaques2[0].Codigo_id.ToString();

                Ataque2.Value = listaAtaques2[1].Nombre;
                txtAtaque2.Value = listaAtaques2[1].Codigo_id.ToString();

                Ataque3.Value = listaAtaques2[2].Nombre;
                txtAtaque3.Value = listaAtaques2[2].Codigo_id.ToString();

                Ataque4.Value = listaAtaques2[3].Nombre;
                txtAtaque4.Value = listaAtaques2[3].Codigo_id.ToString();


                Ataque1.Attributes["onclick"] = "registrar(" + listaAtaques2[0].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques2[0].PoderAtaque) + ")";
                Ataque2.Attributes["onclick"] = "registrar(" + listaAtaques2[1].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques2[1].PoderAtaque) + ")";
                Ataque3.Attributes["onclick"] = "registrar(" + listaAtaques2[2].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques2[2].PoderAtaque) + ")";
                Ataque4.Attributes["onclick"] = "registrar(" + listaAtaques2[3].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques2[3].PoderAtaque) + ")";
                pokemonLocal.ImageUrl = "../App_Themes/Style/img/" + listaPokemones[1].Nombre + "%20espalda.gif";
            }
            if (listaPokemones[2].Codigo_id == pokemonActual_id)
            {
                Ataque1.Value = listaAtaques3[0].Nombre;
                txtAtaque1.Value = listaAtaques3[0].Codigo_id.ToString();

                Ataque2.Value = listaAtaques3[1].Nombre;
                txtAtaque2.Value = listaAtaques3[1].Codigo_id.ToString();

                Ataque3.Value = listaAtaques3[2].Nombre;
                txtAtaque3.Value = listaAtaques3[2].Codigo_id.ToString();

                Ataque4.Value = listaAtaques3[3].Nombre;
                txtAtaque4.Value = listaAtaques3[3].Codigo_id.ToString();
                pokemonLocal.ImageUrl = "../App_Themes/Style/img/" + listaPokemones[2].Nombre + "%20espalda.gif";

                Ataque1.Attributes["onclick"] = "registrar(" + listaAtaques3[0].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques3[0].PoderAtaque) + ")";
                Ataque2.Attributes["onclick"] = "registrar(" + listaAtaques3[1].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques3[1].PoderAtaque) + ")";
                Ataque3.Attributes["onclick"] = "registrar(" + listaAtaques3[2].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques3[2].PoderAtaque) + ")";
                Ataque4.Attributes["onclick"] = "registrar(" + listaAtaques3[3].Codigo_id + "," + Daño(pokemonActual_id, Seguridad.GetUserInSession().Codigo_id, listaAtaques3[3].PoderAtaque) + ")";

            }
        }

        List<Usuario> users = UsuarioBRL.getUsuarios(Seguridad.GetUserInSession().Codigo_id);

        Usuario visita = new Usuario();

        NombreLocal.Text = Seguridad.GetUserInSession().NickName;
        List<Batalla> batallas = UsuarioBRL.getBatallasUsuario(Seguridad.GetUserInSession().Codigo_id);

        int usuario2 = 0;
        int pokeId = 0;

        if (PokemonOponenteID.Value.Equals(null)) {
            pokeId = Convert.ToInt32(PokemonOponenteID.Value);
        }

        
        for (int i = 0; i < batallas.Count; i++)
        {
            if (batallas[i].Codigo_id == Convert.ToInt32(Session["id"].ToString()))
            {
                if (batallas[i].Jugador_1 != Seguridad.GetUserInSession().Codigo_id)
                {
                    usuario2 = batallas[i].Jugador_1;
                }
                else
                {
                    usuario2 = batallas[i].jugador_2;
                }
            }
        }

        for (int i = 0; i < users.Count; i++)
        {
            if (users[i].Codigo_id == usuario2)
            {
                visita = users[i];
            }
        }
        
        NombreVisita.Text = visita.NickName;

        showPokemonVisit(pokeId, visita.Codigo_id);

        string strConversacionId = Session["id"].ToString();
        if (string.IsNullOrEmpty(strConversacionId))
        {
            return;
        }
        try
        {
            txtBatalla_id.Value = strConversacionId;
            int conversacionId = Convert.ToInt32(strConversacionId);

            GridViewDatosBatalla.DataSource = DetalleBatallaBRL.getDetalleBatalla(Seguridad.GetUserInSession().Codigo_id);

            string socketServer = ConfigurationManager.AppSettings["SocketServer"];
            socketIoScript.Text = @"<script type=""text/javascript"" src=""" + socketServer + @"socket.io/socket.io.js""></script>";
            SocketServer.Value = socketServer;

            return;
        }
        catch
        {

        }


    }

    public void showPokemonVisit(int codigo_pokemon, int codigo_usuario)
    {
        List<Pokemon> poke = PokemonBRL.getPokemones(codigo_usuario);
        for (int i = 0; i < poke.Count; i++)
        {
            if (poke[i].Codigo_id == codigo_pokemon)
            {
                pokemonVisita.ImageUrl = "../App_Themes/Style/img/" + poke[i].Nombre + "%20frente.gif";
            }
        }
    }

    public int[] PokemonDetalles(int codigo_pokemon, int codigo_usuario)
    {
        PokemonUsuario pokePlayer = PokemonUsuarioBRL.getPokemonUsuarioByID(codigo_pokemon, codigo_usuario);

        int nivelPoke;
        int defensaPoke;
        int vidaPoke;

        nivelPoke = Formulas.NivelPokemon(pokePlayer.experiencia);
        defensaPoke = Formulas.DefensaPokemon(pokePlayer.experiencia);
        vidaPoke = Formulas.VidaPokemon(pokePlayer.experiencia, pokePlayer.vida);

        int[] poke = { nivelPoke, defensaPoke, vidaPoke };

        return poke;
    }

    public int Daño(int codigo_pokemon, int codigo_usuario, int ataqueDaño)
    {
        PokemonUsuario pokePlayer = PokemonUsuarioBRL.getPokemonUsuarioByID(codigo_pokemon, codigo_usuario);
        return Formulas.DañoAtaque(pokePlayer.experiencia, "normal", "normal", ataqueDaño);
    }


    [WebMethod]
    public static bool guardarDetalleBatalla(int batalla_id, int pokemon_id, int ataque_id, int daño)
    {
        string id = HttpContext.Current.Session["id"].ToString();
        batalla_id = Convert.ToInt32(id);

        string pokemonid = HttpContext.Current.Session["pokemon_id"].ToString();
        pokemon_id = Convert.ToInt32(id);

        DetalleBatalla obj = new DetalleBatalla
        {
            BatallaID = batalla_id,
            AtaqueID = ataque_id,
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