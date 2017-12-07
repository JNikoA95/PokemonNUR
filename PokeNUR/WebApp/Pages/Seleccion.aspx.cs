using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Seleccion : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // fuego agua planta
        string pokemon = RadioButtonList1.SelectedValue;

        if (pokemon.Equals("Fuego"))
            PokemonUsuarioBRL.insrtUsuarioPokemon(Seguridad.GetUserInSession().Codigo_id, 1);


        if (pokemon.Equals("Agua"))
            PokemonUsuarioBRL.insrtUsuarioPokemon(Seguridad.GetUserInSession().Codigo_id, 2);


        if (pokemon.Equals("Planta"))
            PokemonUsuarioBRL.insrtUsuarioPokemon(Seguridad.GetUserInSession().Codigo_id, 3);

        Response.Redirect("SeleccionAtaque.aspx");
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Seguridad.Logout();
        Response.Redirect("login.aspx");
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string poke = RadioButtonList1.SelectedValue;

        string valor = "";
        if (poke == "Fuego")
            valor = "../App_Themes/Style/img/Charmander%20frente.gif";
        if (poke == "Agua")
            valor = "../App_Themes/Style/img/Squirtle%20frente.gif";
        if (poke == "Planta")
            valor = "../App_Themes/Style/img/Bulbasaur%20frente.gif";
        pokemonIMG.ImageUrl = valor;
    }
}