using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Registro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        Usuario usuarioData = UsuarioBRL.getUserData(txtCorreo.Text, txtNickName.Text);

        if (usuarioData == null)
        {
            Usuario nuevo = new Usuario()
            {
                Nombre = txtNombre.Text,
                NickName = txtNickName.Text,
                Correo = txtCorreo.Text,
                Password = txtPassword.Text
            };

            UsuarioBRL.insrtUsuario(nuevo);

            Response.Redirect("Registro.aspx");
        }
        else
        {
            lbMensajeNickName.Visible = true;
            lbMensajeCorreo.Visible = true;
        }

    }
}