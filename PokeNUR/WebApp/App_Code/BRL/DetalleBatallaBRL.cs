using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class DetalleBatallaBRL
{
    public DetalleBatallaBRL()
    {
    }

    public static void insert(DetalleBatalla objDetalleBatalla)
    {
        DetalleBatallaDSTableAdapters.tblDetalleBatallaTableAdapter adapter = new DetalleBatallaDSTableAdapters.tblDetalleBatallaTableAdapter();
        adapter.Insert(objDetalleBatalla.BatallaID, objDetalleBatalla.JugadorID, objDetalleBatalla.AtaqueID, objDetalleBatalla.PokemonID, objDetalleBatalla.Daño);
    }
}