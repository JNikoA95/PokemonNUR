using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Usuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Seguridad.ThereAreUserInSession())
        {
            Response.Redirect("login.aspx");
        }
        Usuario user = Seguridad.GetUserInSession();

        Nombre.Text += ": " + user.NickName;
        Dinero.Text += ": " + user.Dinero.ToString();
        CantidadPokemons.Text += ": 0";
    }
}