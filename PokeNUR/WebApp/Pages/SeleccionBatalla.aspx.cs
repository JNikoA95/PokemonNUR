using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SeleccionBatalla : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        //Usuario user = Seguridad.GetUserInSession();
        //GridViewPokemones.DataSource = PokemonBRL.getPokemones(user.Codigo_id);
        //GridViewPokemones.DataBind();
        GridViewPokemones.DataSource = PokemonBRL.getPokemones(Seguridad.GetUserInSession().Codigo_id);
        GridViewPokemones.DataBind();
    }

    public List<Pokemon> listaPokemones = new List<Pokemon>();

    protected void ButtonHecho_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow item in GridViewPokemones.Rows)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBoxTonto");
            if (cb != null)
            {
                if (cb.Checked)
                {
                    listaPokemones.Add(new Pokemon()
                    {
                        Codigo_id = Convert.ToInt32(item.Cells[1].Text),
                        Nombre = item.Cells[2].Text
                    });

                }
            }
        }
        Session["pokemonesLista"] = listaPokemones;
        int i = Convert.ToInt32( Session["id"] );
        Response.Redirect("Batallas.aspx?id=" + i);
    }

}