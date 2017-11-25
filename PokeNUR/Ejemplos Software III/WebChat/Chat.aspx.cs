using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        if (Request.Cookies["User"] == null) {
            Response.Redirect("Login.aspx");
            return;
        }

        User1.Value = Request.Cookies["User"].Value;
        string strConversacionId = Request.QueryString["conversacionId"];
        if(string.IsNullOrEmpty(strConversacionId))
        {
            Response.Redirect("Inicio.aspx");
            return;
        }
        try
        {
            ConversacionId.Value = strConversacionId;
            int conversacionId = Convert.ToInt32(strConversacionId);

            DataSetTableAdapters.ConversacionTableAdapter adapter = new DataSetTableAdapters.ConversacionTableAdapter();
            DataSet.ConversacionDataTable table = adapter.GetConversacionById(conversacionId);

            if (table[0].user1 == User1.Value)
                User2.Value = table[0].user2;
            else
                User2.Value = table[0].user1;

            DataSetTableAdapters.ChatConversacionTableAdapter chatAdapter = new DataSetTableAdapters.ChatConversacionTableAdapter();
            ChatsRepeater.DataSource = chatAdapter.GetChatsConversacion(conversacionId);
            ChatsRepeater.DataBind();

            string socketServer = ConfigurationManager.AppSettings["SocketServer"];
            socketIoScript.Text = @"<script type=""text/javascript"" src=""" + socketServer + @"socket.io/socket.io.js""></script>";
            SocketServer.Value = socketServer;

            return;
        }
        catch (Exception ex)
        {
            
        }

        Response.Redirect("Inicio.aspx");
    }

    [WebMethod]
    public static bool GuardarMensaje(string userName, string msg, int conversacionId)
    {
        try
        {
            DataSetTableAdapters.ChatConversacionTableAdapter adapter = new DataSetTableAdapters.ChatConversacionTableAdapter();
            int? chatId = 0;
            adapter.Insert(userName, msg, conversacionId, ref chatId);

            return true;
        }
        catch (Exception ex)
        {
            
        }
        return false;
    }
}