using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Batallas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static bool guardarDetalleBatalla(int batalla_id, int pokemon_id, int ataque_id, int daño)
    {
        DetalleBatalla obj = new DetalleBatalla
        {
            AtaqueID = ataque_id,
            BatallaID = batalla_id,
            Daño = daño,
            JugadorID = Seguridad.GetUserInSession().Codigo_id,
            PokemonID = pokemon_id
        };

        try
        {
            DetalleBatallaBRL.insert(obj);
            return true;
        }
        catch
        {
        }
        return false;
    }
}