<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="Inicio" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="NewButton" runat="server" OnClick="NewButton_Click">Nueva Conversacion</asp:LinkButton>
        <asp:GridView ID="ConversacionesGridView" runat="server" OnRowCommand="ConversacionesGridView_RowCommand">
            <EmptyDataTemplate>
                <p class="text-center">
                    No hay conversaciones registradas
                </p>
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="GoToButton" runat="server" Text="Entrar"
                            CommandArgument='<%# Eval("conversacionId") %>' CommandName="Enter"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Usuario 1" DataField="user1" />
                <asp:BoundField HeaderText="Usuario 2" DataField="user2" />
            </Columns>
        </asp:GridView>
        <asp:HiddenField ID="Destinatario" runat="server" />
        <script type="text/javascript">
            $(document).ready(function () {
                $("#<%= NewButton.ClientID %>").click(function () {
                    var destinatario = prompt("Ingrese el destinatario");
                    if (!destinatario || $.trim(destinatario) == "")
                        return false;
                    $("#<%= Destinatario.ClientID %>").val(destinatario);
                    return true;
                });
            });
        </script>
    </form>
</body>
</html>
