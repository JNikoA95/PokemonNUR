<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Pages_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            

                <h2 class="form-signin-heading">Login</h2>
                <asp:Label runat="server" AssociatedControlID="txtUsuario" class="sr-only">Nombre de Usuario</asp:Label>
                <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" placeholder="Nombre o Nick" autofocus="autofocus"></asp:TextBox>
                <br />
                <br />
                <asp:Label runat="server" AssociatedControlID="txtPassword" class="sr-only">Contraseña</asp:Label>
                <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Contraseña" TextMode="Password"></asp:TextBox>

                <asp:Label ID="MsgLabel" runat="server" Visible="false" Text="El Nombre de Usuario y/o Contraseña son invalidos" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Button ID="BtnLogin" runat="server"  Text="Entrar" OnClick="BtnLogin_Click"/>
                 <br />
                <br />
                <a href="#">Recuperar mi contraseña</a>
                 <a href="Registro.aspx">Registrarme</a>

        </div>
        <!-- /container -->
    </form>
</body>
</html>
