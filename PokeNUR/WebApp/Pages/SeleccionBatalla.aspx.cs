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
        if (!Seguridad.ThereAreUserInSession())
        {
            Response.Redirect("login.aspx");
        }
        string id = Request["id"];

        if (id == null)
            Response.Redirect("Usuario.aspx");

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
        int pokemonID = 0;
        foreach (GridViewRow item in GridViewPokemones.Rows)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBoxTonto");
            if (cb != null)
            {
                if (cb.Checked)
                {
                    Pokemon obj = new Pokemon()
                    {
                        Codigo_id = Convert.ToInt32(item.Cells[1].Text),
                        Nombre = item.Cells[2].Text
                    };
                    listaPokemones.Add(obj);
                    pokemonID = obj.Codigo_id;
                }
            }
        }

        if (listaPokemones.Count <= 0)
            return;

        Session["pokemonesLista"] = listaPokemones;
        int i = Convert.ToInt32(Session["id"]);
        Session["pokemon_id"] = pokemonID;
        Response.Redirect("Batallas.aspx?id=" + i + "&pokemon_id=" + pokemonID);


    }

}