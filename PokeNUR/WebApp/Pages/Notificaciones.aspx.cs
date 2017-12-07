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
        if (IsPostBack)
            return;

        NotificacionesRep.DataSource = UsuarioBRL.getBatallasUsuario(Seguridad.GetUserInSession().Codigo_id);
        NotificacionesRep.DataBind();
    }

    protected void NotificacionesRep_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}