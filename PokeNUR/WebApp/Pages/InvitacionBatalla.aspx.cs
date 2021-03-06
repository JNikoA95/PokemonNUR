﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_InvitacionBatalla : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Seguridad.ThereAreUserInSession())
        {
            Response.Redirect("login.aspx");
        }
        if (IsPostBack)
            return;

        if (PokemonUsuarioBRL.getUsuarioPokemon(Seguridad.GetUserInSession().NickName, Seguridad.GetUserInSession().Password) == 0)
        {
            Response.Redirect("Seleccion.aspx");
        }

        InvitacionesRep.DataSource = UsuarioBRL.getUsuarios(Seguridad.GetUserInSession().Codigo_id);
        InvitacionesRep.DataBind();
    }

    //protected void Invitar_Click(object sender, EventArgs e)
    //{
    //    Button id = (Button)sender;
    //    Button nickName = (Button)sender;
    //    Button correo = (Button)sender;
    //    int Id = Convert.ToInt32(id.CommandArgument);
    //    string nombre = nickName.CommandArgument;
    //    string Correo = correo.CommandArgument;
    //    InvitacionBRL.insertarBatalla("andradenik09@gmail.com", 1, "JNikoA95");

    //}


    
    protected void InvitacionesRep_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Jugador")
        {
            string nick = e.CommandArgument == null ? "" : e.CommandArgument.ToString();
            int idBatalla = InvitacionBRL.insertarBatalla(nick);

            Session["id"] = idBatalla;
            Response.Redirect("SeleccionBatalla.aspx?id=" + idBatalla);
        }
    }


    
}