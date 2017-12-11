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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        if (!Seguridad.ThereAreUserInSession())
        {
            Response.Redirect("login.aspx");
            return;
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
        }

        if (listaPokemones.Count == 2)
        {
            listaAtaques1 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[0].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
            listaAtaques2 = PokemonAtaqueBRL.getAtaquesByPokemon(listaPokemones[1].Codigo_id, Seguridad.GetUserInSession().Codigo_id);
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
            txtAtaque1.Value = listaAtaques1[0].Codigo_id.ToString();
            Ataque2.Value = listaAtaques1[1].Nombre;
            txtAtaque1.Value = listaAtaques1[1].Codigo_id.ToString();
            Ataque3.Value = listaAtaques1[2].Nombre;
            txtAtaque1.Value = listaAtaques1[2].Codigo_id.ToString();
            Ataque4.Value = listaAtaques1[3].Nombre;
            txtAtaque1.Value = listaAtaques1[3].Codigo_id.ToString();
            
            pokemonLocal.ImageUrl = "../App_Themes/Style/img/" + listaPokemones[0].Nombre + "%20espalda.gif";
        }

        if (listaPokemones.Count == 2)
        {
            if (listaPokemones[1].Codigo_id == pokemonActual_id)
            {
                Ataque1.Value = listaAtaques2[0].Nombre;
                txtAtaque1.Value = listaAtaques2[0].Codigo_id.ToString();
                Ataque2.Value = listaAtaques2[1].Nombre;
                txtAtaque1.Value = listaAtaques2[1].Codigo_id.ToString();
                Ataque3.Value = listaAtaques2[2].Nombre;
                txtAtaque1.Value = listaAtaques2[2].Codigo_id.ToString();
                Ataque4.Value = listaAtaques2[3].Nombre;
                txtAtaque1.Value = listaAtaques2[3].Codigo_id.ToString();

                pokemonLocal.ImageUrl = "../App_Themes/Style/img/" + listaPokemones[1].Nombre + "%20espalda.gif";
            }
        }

        if (listaPokemones.Count == 3)
        {
            if (listaPokemones[2].Codigo_id == pokemonActual_id)
            {
                Ataque1.Value = listaAtaques3[0].Nombre;
                txtAtaque1.Value = listaAtaques3[0].Codigo_id.ToString();
                Ataque2.Value = listaAtaques3[1].Nombre;
                txtAtaque1.Value = listaAtaques3[1].Codigo_id.ToString();
                Ataque3.Value = listaAtaques3[2].Nombre;
                txtAtaque1.Value = listaAtaques3[2].Codigo_id.ToString();
                Ataque4.Value = listaAtaques3[3].Nombre;
                txtAtaque1.Value = listaAtaques3[3].Codigo_id.ToString();
                pokemonLocal.ImageUrl = "../App_Themes/Style/img/" + listaPokemones[2].Nombre + "%20espalda.gif";
            }
        }
        pokemonVisita.ImageUrl = "../App_Themes/Style/img/Machoke%20frente.gif";

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
            Daño = 60,
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