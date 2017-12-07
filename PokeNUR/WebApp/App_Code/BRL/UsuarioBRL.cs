using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class UsuarioBRL
{
    public UsuarioBRL()
    {
    }

    public static List<Usuario> getUsuarios(int id)
    {
        List<Usuario> lista = new List<Usuario>();
        UserDSTableAdapters.UsuariosTableAdapter adapter = new UserDSTableAdapters.UsuariosTableAdapter();
        UserDS.UsuariosDataTable table = adapter.GetUsuarioSinLocal(id);

        foreach (UserDS.UsuariosRow row in table)
        {
            Usuario obj = new Usuario
            {
                Codigo_id = row.codigo_id,
                Nombre = row.nombre,
                Correo = row.correo,
                Dinero = row.dinero,
                NickName = row.nickName,
                Password = row.password
            };
            lista.Add(obj);
        }
        return lista;
    }

    public static List<Batalla> getBatallasUsuario(int id)
    {
        List<Batalla> listaBatallas = new List<Batalla>();
        BatallaDSTableAdapters.BatallasTableAdapter adapter = new BatallaDSTableAdapters.BatallasTableAdapter();
        BatallaDS.BatallasDataTable table = adapter.upd_getDatosBatalla(id);

        foreach (BatallaDS.BatallasRow row in table)
        {
            Batalla obj = new Batalla
            {
                Codigo_id = row.idBatalla,
                Jugador_1 = row.jugador1,
                jugador_2 = row.jugador2
            };
            listaBatallas.Add(obj);
        }
        return listaBatallas;
    }


    public static void insrtUsuario(Usuario obj)
    {
        UserDSTableAdapters.UsuariosTableAdapter adapter = new UserDSTableAdapters.UsuariosTableAdapter();
        adapter.Insert(obj.Nombre, obj.NickName, obj.Correo, obj.Password, obj.Dinero);
    }

    public static void updateUsuario(Usuario obj)
    {
        UserDSTableAdapters.UsuariosTableAdapter adapter = new UserDSTableAdapters.UsuariosTableAdapter();
        adapter.Update(obj.Codigo_id, obj.Nombre, obj.NickName, obj.Correo, obj.Password, obj.Dinero);
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
                Password = row.password,
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
                Password = row.password,
                Dinero = row.dinero
            };
        }

        return user;
    }

    public static Usuario getUsuarioNick(string nick)
    {
        if (string.IsNullOrEmpty(nick))
        {
            throw new ArgumentException("No puede existir campos nulos");

        }
        UserDSTableAdapters.UsuariosTableAdapter adapter = new UserDSTableAdapters.UsuariosTableAdapter();
        UserDS.UsuariosDataTable table = adapter.GetUsuarioByNick(nick);

        Usuario user = null;
        //Deberia dar como resulado 1
        if (table.Rows.Count == 1)
        {
            UserDS.UsuariosRow row = table[0];
            user = new Usuario()
            {
                Codigo_id = row.codigo_id,
                Nombre = row.nombre,
                NickName = row.nickName,
                Correo = row.correo,
                Password = row.password,
                Dinero = row.dinero
            };
        }
        return user;
    }

}