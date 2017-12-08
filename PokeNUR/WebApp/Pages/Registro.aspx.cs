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

        Usuario userData = UsuarioBRL.getUserData(txtCorreo.Text, txtNickName.Text);

        if (!existeCorreo(txtCorreo.Text))
        {
            lbMensajeCorreo.Visible = true;
        }

        if (!existeNick(txtNickName.Text))
        {
            lbMensajeNickName.Visible = true;
        }

        if (userData == null)
        {
            if (!existeCorreo(txtCorreo.Text) && !existeNick(txtNickName.Text)) { 
            Usuario nuevo = new Usuario()
            {
                Nombre = txtNombre.Text,
                NickName = txtNickName.Text,
                Correo = txtCorreo.Text,
                Password = txtPassword.Text,
                Dinero = 50
            };

            UsuarioBRL.insrtUsuario(nuevo);

            Response.Redirect("login.aspx");
        }
    }
        else
        {
            lbMensajeNickName.Visible = true;

            lbMensajeCorreo.Visible = true;
        }
    }
    public bool existeNick(String nick)
{
    string userNick = UsuarioBRL.getUsuarioNick(nick).NickName;
    if (userNick != null)
    {
        return true;
    }
    return false;
}

public bool existeCorreo(String correo)
{
    List<Usuario> userNick = UsuarioBRL.getAllUsers();
    Boolean exist = false;
    foreach (Usuario item in userNick)
    {
        if (item.Correo.Equals(correo))
        {
            exist = true;
        }
    }

    return exist;

}
}