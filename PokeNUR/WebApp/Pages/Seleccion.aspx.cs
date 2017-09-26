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

        Response.Redirect("Default.aspx");
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Seguridad.Logout();
        Response.Redirect("login.aspx");
    }
}