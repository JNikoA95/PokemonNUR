using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Descripción breve de Correo
/// </summary>
public class CorreoM
{
    Boolean estado = true;
    string merror;
    public CorreoM(string destino, string asunto, string mensaje)
    {
        MailMessage mens = new MailMessage();
        mens.IsBodyHtml = true;
        mens.From = new MailAddress("PokeNur2017@gmail.com");
        mens.To.Add(destino);
        mens.Subject = asunto;
        mens.Body = mensaje;
        mens.IsBodyHtml = false;
        mens.Priority = MailPriority.Normal;
        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.Credentials = new System.Net.NetworkCredential("pokeNur2017@gmail.com", "PokeNur0987654321");
        smtp.EnableSsl = true;

        try {
            smtp.Send(mens);
        }
        catch (SmtpException error)
        {
            estado = false;
            merror = error.Message.ToString();
        }
    }

    public Boolean Estado
    {
        get { return estado; }
    }

    public string mensaje_error
    {
        get { return merror; }
    }

}