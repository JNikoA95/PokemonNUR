using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_RecuperarContraseña : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        //Correo correo = new Correo("ass.alejandra@gmail.com", "Algo", "Esto");
        RecuperarContraseñaBRL.insesrtCodigo(txtCorreo.Text);
    }

    protected void Unnamed2_Click(object sender, EventArgs e)
    {
       int a = RecuperarContraseñaBRL.codigoValido(txtCorreo.Text, codigoR.Text);
        if(a < 10)
        {
            nueva.Enabled = true;
        }
        else
        {
            nueva.Enabled = false;
        }
    }

    protected void Unnamed3_Click(object sender, EventArgs e)
    {
        RecuperarContraseñaBRL.cambiarContraseña(txtCorreo.Text, contraseñaNueva.Text);
        Response.Redirect("login.aspx");
    }
}