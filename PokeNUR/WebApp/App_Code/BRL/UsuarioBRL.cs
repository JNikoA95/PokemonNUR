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

    public static Usuario getUsuarioByNick(string nick, string pass) {
        if (string.IsNullOrEmpty(nick) || string.IsNullOrEmpty(pass))
        {
            throw new ArgumentException("No puede existir campos nulo");

        }
        UserDSTableAdapters.UsuarioRegTableAdapter adapter = new UserDSTableAdapters.UsuarioRegTableAdapter();
        UserDS.UsuarioRegDataTable table = adapter.get_usuarioByNickName(nick, pass);

        Usuario user = null;
        //Deberia dar como resulado 1
        if (table.Rows.Count == 1)
        {
            UserDS.UsuarioRegRow row = table[0];
            user = new Usuario()
            {
                Codigo_id = row.codigo_id,
                Nombre = row.nombre,
                NickName = row.nickName,
                Correo = row.correo,
                Password = row.password
            };
        }
        return user;
    }

    public static Usuario getUserData(string correo, string nickName)
    {
        Usuario user = null;

        UserDSTableAdapters.UsuarioByCorre_nickNameTableAdapter adapter = new UserDSTableAdapters.UsuarioByCorre_nickNameTableAdapter();
        UserDS.UsuarioByCorre_nickNameDataTable table = adapter.GetUser(correo, nickName);

        if (table.Rows.Count == 1)
        {
            UserDS.UsuarioByCorre_nickNameRow row = table[0];
            user = new Usuario()
            {
                Codigo_id = row.codigo_id,
                Nombre = row.nombre,
                NickName = row.nickName,
                Correo = row.correo,
                Password = row.password
            };
        }

        return user;
    }
}