using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de InvitacionBRL
/// </summary>
public class InvitacionBRL
{
    public InvitacionBRL()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public static void insertarBatalla(string nick)
    {
        int? salida = 0;

        string codigo = String.Format("http://localhost:12345/Pages/Default.aspx");



        CorreoM mail = new CorreoM(UsuarioBRL.getUsuarioNick(nick).Correo + "", "PokeNUR - Tienes una Invitacion Nueva!!", Seguridad.GetUserInSession().NickName.Trim() + " te invito a una batalla, sigue este enlace para responderle: " + codigo);


        if (!mail.Estado)
        {
            Console.Write("ERROR");

        }
        BatallaDSTableAdapters.BatallasTableAdapter adapter = new BatallaDSTableAdapters.BatallasTableAdapter();
        UserDSTableAdapters.UsuarioRegTableAdapter adap = new UserDSTableAdapters.UsuarioRegTableAdapter();
        adapter.mkBatallas(Seguridad.GetUserInSession().Codigo_id, UsuarioBRL.getUsuarioNick(nick).Codigo_id, ref salida);
    }
}