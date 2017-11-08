using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority +
        //Request.ApplicationPath.TrimEnd('/') + "/";
        //url.Text = baseUrl;
        if (Seguridad.ThereAreUserInSession()) {
            if(PokemonUsuarioBRL.getUsuarioPokemon(Seguridad.GetUserInSession().NickName, Seguridad.GetUserInSession().Password) == 0) { 
                Response.Redirect("Seleccion.aspx");
            }
            else
            {
                Response.Redirect("Usuario.aspx");
            }
        }
            
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        MsgLabel.Visible = false;
        string usuario = txtUsuario.Text;
        string password = txtPassword.Text;

        Usuario objUsuario = Seguridad.IsUserValid(usuario, password);

        if (objUsuario == null)
        {
            MsgLabel.Visible = true;
            return;
        }

        Seguridad.SetUserInSession(objUsuario);

        if (PokemonUsuarioBRL.getUsuarioPokemon(Seguridad.GetUserInSession().NickName, Seguridad.GetUserInSession().Password) == 0)
        {

            Response.Redirect("Seleccion.aspx");
        }
        else
        {
            Response.Redirect("Usuario.aspx");
        }
        }
}