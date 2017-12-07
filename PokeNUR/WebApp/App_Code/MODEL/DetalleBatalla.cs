using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class DetalleBatalla
{
    public DetalleBatalla()
    {
    }

    public int CodigoID { get; set; }
    public int BatallaID { get; set; }
    public int JugadorID { get; set; }
    public int AtaqueID { get; set; }
    public int PokemonID { get; set; }
    public int Daño { get; set; }
}