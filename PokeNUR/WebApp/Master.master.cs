using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Seguridad.ThereAreUserInSession())
        {
            Response.Redirect("login.aspx");
        }
        if (IsPostBack)
        {
            return;
        }
    }
    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Seguridad.Logout();
        Response.Redirect("login.aspx");
    }
}
