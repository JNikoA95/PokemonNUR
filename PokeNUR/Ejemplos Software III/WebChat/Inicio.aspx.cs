using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        if (Request.Cookies["User"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
        try
        {
            DataSetTableAdapters.ConversacionTableAdapter adapter = new DataSetTableAdapters.ConversacionTableAdapter();
            ConversacionesGridView.DataSource = adapter.GetConversaciones(Request.Cookies["User"].Value);
            ConversacionesGridView.DataBind();
        }
        catch (Exception ex)
        {
            
        }

    }

    protected void NewButton_Click(object sender, EventArgs e)
    {
        var user1 = Request.Cookies["User"].Value;
        var user2 = Destinatario.Value;

        DataSetTableAdapters.ConversacionTableAdapter adapter = new DataSetTableAdapters.ConversacionTableAdapter();
        int? conversacionId = 0;
        adapter.CrearConversacion(user1, user2, ref conversacionId);

        if (conversacionId != null && conversacionId.Value > 0)
            Response.Redirect("Chat.aspx?conversacionId=" + conversacionId.Value.ToString());
    }

    protected void ConversacionesGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        x   if(e.CommandName == "Enter")
        {
            Response.Redirect("Chat.aspx?conversacionId=" + e.CommandArgument.ToString());
        }
    }
}