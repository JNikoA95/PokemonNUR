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
        if (txtCorreo.Text.Trim().Equals(""))
        {
            Response.Write("<script>window.alert('Campos vacios encontrados. Ingrese la informacion necesaria');</script>");
            return;
        }

        int existe = RecuperarContraseñaBRL.ExisteCorreo(txtCorreo.Text.Trim());
        if (existe == 0)
        {
            Response.Write("<script>window.alert('El correo ingresado no esta enlazado a una cuenta');</script>");
            return;
        }
        else {
            
            RecuperarContraseñaBRL.insesrtCodigo(txtCorreo.Text);
            codigoValido.Visible = true;
            campoCorreo.Visible = true;
        }

    }

    protected void Unnamed2_Click(object sender, EventArgs e)
    {
        if (txtCorreo.Text.Trim().Equals("") || codigoR.Text.Trim().Equals(""))
        {
            Response.Write("<script>window.alert('Campos vacios encontrados. Ingrese la informacion necesaria');</script>");
            return;
        }

        int existe = RecuperarContraseñaBRL.ExisteCodigo(txtCorreo.Text.Trim(), codigoR.Text.Trim());
        if (existe == 0)
        {
            Response.Write("<script>window.alert('El codigo ingresado es invalido');</script>");
            return;
        }
        else
        {
            int a = RecuperarContraseñaBRL.codigoValido(txtCorreo.Text.Trim(), codigoR.Text.Trim());
            if (a > 10)
            {
                Response.Write("<script>window.alert('Tiempo de validez del codigo excedido.Por favor solicite otro codigo');</script>");
            }
            else
            {
                codigoValido.Visible = false;
                contr.Visible = true;

            }
        }
    }

    protected void Unnamed3_Click(object sender, EventArgs e)
    {
        if (nueva.Text.Trim().Equals(""))
        {
            Response.Write("<script>window.alert('Campos vacios encontrados. Ingrese la informacion necesaria');</script>");
            return;
        }
        RecuperarContraseñaBRL.cambiarContraseña(txtCorreo.Text, contraseñaNueva.Text);
        Response.Write("<script>window.alert('Cambio Exitoso!!');</script>");

        Response.Redirect("login.aspx");
    }
}