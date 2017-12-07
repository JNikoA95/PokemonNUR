using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Usuario
/// </summary>
public class Usuario
{
    public int Codigo_id { get; set; }
    public string Nombre { get; set; }
    public string Correo { get; set; }
    public string NickName { get; set; }
    public string Password { get; set; }
    public int Dinero { get; set; }
    public Usuario()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
}