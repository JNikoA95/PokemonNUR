using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Descripción breve de Correo
/// </summary>
public class Correo
{
    public Correo(string destino, string asunto, string mensaje)
    {
        MailMessage mens = new MailMessage();
        mens.From = new MailAddress("PokeNur2017@gmail.com");
        mens.To.Add("ass.alejandra@gmail.com");
        mens.Subject = "Prueba 1";
        mens.Body = "Mensaje de Prueba";
        mens.IsBodyHtml = false;
        mens.Priority = MailPriority.Normal;
        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.Credentials = new System.Net.NetworkCredential("pokeNur2017@gmail.com", "pokenur0987654321");
        smtp.EnableSsl = true;

        try {
            smtp.Send(mens);
        }
        catch(Exception ex) {
            Console.Write("ERRORRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR" + ex.ToString());
        }
    }
}