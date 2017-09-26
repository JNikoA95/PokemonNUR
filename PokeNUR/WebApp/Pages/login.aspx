<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Pages_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../App_Themes/Style/Style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">


            <h2 class="title">Login</h2>
            
            <asp:TextBox runat="server" ID="txtUsuario" CssClass="imputs" placeholder="Nick" autofocus="autofocus"></asp:TextBox>
            <br />
            <br />
            
            <asp:TextBox runat="server" ID="txtPassword" CssClass="imputs" placeholder="Contraseña" TextMode="Password"></asp:TextBox>

            <asp:Label ID="MsgLabel" runat="server" Visible="false" Text="El Nombre de Usuario y/o Contraseña son invalidos" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <div class="boton-container">
                <asp:Button CssClass="boton" ID="BtnLogin" runat="server" Text="Entrar" OnClick="BtnLogin_Click" />
            </div>
            <br />
            <br />
            <a class="links" href="RecuperarContraseña.aspx">Recuperar mi contraseña</a>
            <a class="links" href="Registro.aspx">Registrarme</a>

        </div>
        <!-- /container -->
    </form>
</body>
</html>
