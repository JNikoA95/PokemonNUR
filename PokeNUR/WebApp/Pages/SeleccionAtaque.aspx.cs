using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SeleccionAtaque : System.Web.UI.Page
{
    List<Ataque> lista = new List<Ataque>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        Usuario user = Seguridad.GetUserInSession();
        GridViewPokemones.DataSource = PokemonBRL.getPokemones(user.Codigo_id);
        GridViewPokemones.DataBind();

        GridViewAtaques.DataSource = AtaquesBRL.getAtaquesByTipo(Convert.ToInt32(GridViewPokemones.Rows[0].Cells[0].Text));
        GridViewAtaques.DataBind();
    }

    protected void ButtonHecho_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow item in GridViewAtaques.Rows)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBoxTonto");
            if (cb != null)
            {
                if (cb.Checked)
                {
                    lista.Add(new Ataque()
                    {
                        Codigo_id = Convert.ToInt32(item.Cells[1].Text)
                    });
                }
            }
        }
    }
}