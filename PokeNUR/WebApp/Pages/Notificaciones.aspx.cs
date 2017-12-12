using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Notificaciones : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Seguridad.ThereAreUserInSession())
        {
            Response.Redirect("login.aspx");
        }
        if (IsPostBack)
            return;

        if (PokemonUsuarioBRL.getUsuarioPokemon(Seguridad.GetUserInSession().NickName, Seguridad.GetUserInSession().Password) == 0)
        {
            Response.Redirect("Seleccion.aspx");
        }

        NotificacionesRep.DataSource = UsuarioBRL.getBatallasUsuario(Seguridad.GetUserInSession().Codigo_id);
        NotificacionesRep.DataBind();
    }

    protected void NotificacionesRep_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("Batalla"))
        {
            int i = Convert.ToInt32(e.CommandArgument);
            DetalleBatallaBRL.updateEstadoBatalla(i);
            Session["id"] = i;

            Response.Redirect("SeleccionBatalla.aspx?id=" + i);
        }
    }
}