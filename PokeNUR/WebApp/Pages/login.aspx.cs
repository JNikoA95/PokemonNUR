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

    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        MsgLabel.Visible = false;
        string usuario = txtPassword.Text;
        string password = txtPassword.Text;

        Usuario objUsuario = Seguridad.IsUserValid(usuario, password);

        if (objUsuario == null)
        {
            MsgLabel.Visible = true;
            return;
        }

        Seguridad.SetUserInSession(objUsuario);
        Response.Redirect("Default.aspx");
    }
}