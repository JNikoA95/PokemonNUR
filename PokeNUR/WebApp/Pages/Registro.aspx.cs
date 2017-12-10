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

        if (Convert.ToInt32(txtPassword.Text.Trim().Length) < 6)
        {
            return;
        }

        Usuario userData = UsuarioBRL.getUserData(txtCorreo.Text, txtNickName.Text);

        if (userData == null)
        {
            if (!existeCorreo(txtCorreo.Text) && !existeNick(txtNickName.Text))
            {
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
        Usuario userNick = UsuarioBRL.getUsuarioNick(nick);
        if (userNick == null)
        {
            return false;
        }
        string nickName = userNick.NickName;
        if (nickName != null)
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

    protected void Cancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}