using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Seguridad.ThereAreUserInSession())
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Seguridad.Logout();
        Response.Redirect("login.aspx");
    }
}