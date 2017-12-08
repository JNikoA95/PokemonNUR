using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class DetalleBatallaBRL
{
    public DetalleBatallaBRL()
    {
    }

    public static List<DetalleBatalla> getDetalleBatalla(int usuarioID)
    {
        List<DetalleBatalla> lista = new List<DetalleBatalla>();
        DetalleBatallaDSTableAdapters.tblDetalleBatallaTableAdapter adapter = new DetalleBatallaDSTableAdapters.tblDetalleBatallaTableAdapter();
        DetalleBatallaDS.tblDetalleBatallaDataTable table = adapter.GetDetalleBatalla(usuarioID);

        foreach (DetalleBatallaDS.tblDetalleBatallaRow row in table)
        {
            DetalleBatalla obj = new DetalleBatalla
            {
                AtaqueID = row.ataque_id,
                BatallaID = row.batalla_id,
                CodigoID = row.codigo_id,
                Daño = row.daño,
                JugadorID = row.jugador_id,
                PokemonID = row.pokemon_id
            };
            lista.Add(obj);
        }
        return lista;
    }

    public static void insert(DetalleBatalla objDetalleBatalla)
    {
        DetalleBatallaDSTableAdapters.tblDetalleBatallaTableAdapter adapter = new DetalleBatallaDSTableAdapters.tblDetalleBatallaTableAdapter();
        adapter.Insert(objDetalleBatalla.BatallaID, objDetalleBatalla.JugadorID, objDetalleBatalla.AtaqueID, objDetalleBatalla.PokemonID, objDetalleBatalla.Daño);
    }
}