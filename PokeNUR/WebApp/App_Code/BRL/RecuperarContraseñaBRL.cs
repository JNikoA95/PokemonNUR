using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de RecuperarContraseñaN
/// </summary>
public class RecuperarContraseñaBRL
{
    public RecuperarContraseñaBRL()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public static void insesrtCodigo(string correo)
    {
        int? salida = 0;
        string codigo =  System.Web.Security.Membership.GeneratePassword(10, 0);
        
        CorreoM mail = new CorreoM(correo.ToString()+"", "PokeNUR - Tu Codigo de Recuperacion", "Este es el codigo que debe ingresar para hacer posible su cambio de contraseña:   " + codigo);

        if (!mail.Estado)
        {
            Console.Write("ERROR");

        }
        RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter adapter = new RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter();
        adapter.getIdByCorreo_tblUsuarios(correo, ref salida);
        adapter.pCodigosRec(salida, codigo);
    }

    public static int codigoValido(string correo, string codigo)
    {
        int? salida = 0;
        int? diferencia = 0;
        RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter adapter = new RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter();
        adapter.getIdByCorreo_tblUsuarios(correo, ref salida);
        adapter.val_CodRecuperacion(salida.Value, codigo, ref diferencia);

        return diferencia.Value;
    }

    public static int ExisteCodigo(string correo, string codigo)
    {
        int? salida = 0;
        RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter adapter = new RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter();
        adapter.getExistCodigo_tblUsuarios(correo, codigo, ref salida);

        return salida.Value;
    }

    public static int ExisteCorreo(string correo)
    {
        int? salida = 0;
        RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter adapter = new RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter();
        adapter.getExistCorreo_tblUsuarios(correo, ref salida);

        return salida.Value;
    }

    public static void cambiarContraseña(string correo, string nuevaContraseña)
    {
        int? salida = 0;
        RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter adapter = new RecuperarContraseñaTableAdapters.CodRecuperacionTableAdapter();
        adapter.getIdByCorreo_tblUsuarios(correo, ref salida);
        adapter.upd_password_tblUsuarios(salida, nuevaContraseña);
    }
}