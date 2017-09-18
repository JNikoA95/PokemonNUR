using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Seguridad
/// </summary>
public class Seguridad
{
	public Seguridad()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static Usuario IsUserValid(string nick, string password)
    {
         
        try
        {
           Usuario usr = UsuarioBRL.getUsuarioByNick(nick);
            //dice que no son iguales y se sale
           if (usr != null && usr.Password == password)
           {
               return usr;
           }
        }
        catch (Exception e)
        {
            if (e.Source != null)
                Console.WriteLine("Exception source: {0}", e.Source);
            throw; 
        }
        return null;
    }

    public static void SetUserInSession(Usuario user)
    {
        HttpContext.Current.Session["usuario"] = user;
    }

    public static Usuario GetUserInSession()
    {

        return ThereAreUserInSession() ? (Usuario)HttpContext.Current.Session["usuario"] : null;
    }

    public static bool ThereAreUserInSession()
    {
        return HttpContext.Current.Session["usuario"] != null;
    }

    public static void Logout()
    {
        HttpContext.Current.Session["usuario"] = null;
    }
}