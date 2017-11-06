using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Batalla
/// </summary>
public class Batalla
{
    public Batalla()
    {}

    public int Codigo_id { get; set; }
    public int Jugador_1 { get; set; }
    public int jugador_2 { get; set; }
    public bool estado { get; set; }
}