using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de UsuarioBRL
/// </summary>
public class UsuarioBRL
{
    public UsuarioBRL()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public static void insrtUsuario(Usuario obj)
    {
        UserDSTableAdapters.UsuariosTableAdapter adapter = new UserDSTableAdapters.UsuariosTableAdapter();
        adapter.Insert(obj.Nombre, obj.NickName, obj.Correo, obj.Password);
    }

    public static void updateUsuario(Usuario obj)
    {
        UserDSTableAdapters.UsuariosTableAdapter adapter = new UserDSTableAdapters.UsuariosTableAdapter();
        adapter.Update(obj.Codigo_id, obj.Nombre, obj.NickName, obj.Correo, obj.Password);
    }

    public static void deleteUsuario(int codigo_id)
    {
        UserDSTableAdapters.UsuariosTableAdapter adapter = new UserDSTableAdapters.UsuariosTableAdapter();
        adapter.Delete(codigo_id);
    }
}