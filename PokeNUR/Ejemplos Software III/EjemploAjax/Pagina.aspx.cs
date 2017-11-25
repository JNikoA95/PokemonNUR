using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pagina : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    [WebMethod]
    public static string getNombreCompleto(String nombre, String apellido)
    {
        return nombre + " " + apellido;
    }


}