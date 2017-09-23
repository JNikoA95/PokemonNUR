<%@ Page  Language="C#"  AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Pages_Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            
            <asp:Label ID="lbNombre" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lbNickName" runat="server" Text="Nombre de Usuario"></asp:Label>
            <asp:TextBox ID="txtNickName" runat="server"></asp:TextBox>
            <asp:Label ID="lbMensajeNickName" runat="server" Text="El nombre de usuario ya esta ocupado" Visible="false" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lbCorreo" runat="server" Text="Correo Electronico"></asp:Label>
            <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
            <asp:Label ID="lbMensajeCorreo" runat="server" Text="El ya esta registrado" Visible="false" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lbPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
            <asp:Button ID="Cancelar" runat="server" Text="Cancelar" />
            <br />
            <br />

        </div>
        <!-- /container -->
    </form>
</body>
</html>


