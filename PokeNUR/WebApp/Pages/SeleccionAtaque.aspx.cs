using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SeleccionAtaque : System.Web.UI.Page
{
    List<PokemonAtaque> lista = new List<PokemonAtaque>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Seguridad.ThereAreUserInSession())
        {
            Response.Redirect("login.aspx");
        }

        string idPokemon = Request["idPokemon"];

        if (idPokemon == null)
            Response.Redirect("Usuario.aspx");

        if (IsPostBack)
            return;

        Usuario user = Seguridad.GetUserInSession();
        GridViewPokemones.DataSource = PokemonBRL.getPokemones(user.Codigo_id);
        GridViewPokemones.DataBind();

        if(GridViewPokemones.Rows.Count <= 0)
        {
            Response.Redirect("Seleccion.aspx");
        }

        if (PokemonUsuarioBRL.getUsuarioPokemon(Seguridad.GetUserInSession().NickName, Seguridad.GetUserInSession().Password) == 0)
        {
            Response.Redirect("Seleccion.aspx");
        }

        if (PokemonUsuarioBRL.getUsuarioPokemonAtaque(Seguridad.GetUserInSession().Codigo_id, Convert.ToInt32(idPokemon)) > 0)
        {
            Response.Redirect("Usuario.aspx");
        }

        GridViewAtaques.DataSource = AtaquesBRL.getAtaquesByTipo(Convert.ToInt32(GridViewPokemones.Rows[0].Cells[0].Text));
        GridViewAtaques.DataBind();
    }

    protected void ButtonHecho_Click(object sender, EventArgs e)
    {
        int cantidadAtaques = 0;
        foreach (GridViewRow item in GridViewAtaques.Rows)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBoxTonto");
            if (cb != null)
            {

                if (cb.Checked)
                {
                    if (cantidadAtaques >= 4)
                    {
                        return;
                    }


                    lista.Add(new PokemonAtaque()
                    {
                        Ataque_id = Convert.ToInt32(item.Cells[1].Text),
                        Pokemon_id = Convert.ToInt32(GridViewPokemones.Rows[0].Cells[0].Text),
                        Usuario_id = Seguridad.GetUserInSession().Codigo_id
                    });
                    cantidadAtaques++;

                }
            }
        }

        foreach (PokemonAtaque obj in lista)
        {
            PokemonAtaqueBRL.insert(obj);
        }

        Response.Redirect("InvitacionBatalla.aspx");
    }
}