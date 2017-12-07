<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Pages_Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../App_Themes/Style/Style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <asp:Label ID="lbNombre" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox CssClass="imputs" ID="txtNombre" runat="server"></asp:TextBox>
            <div>
                <asp:RequiredFieldValidator Style="color: red" ID="vlNombre" runat="server" ErrorMessage="Ingrese su Nombre" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
            </div>
            <asp:RegularExpressionValidator ID="revNombre" runat="server" Style="color: red" ErrorMessage="Caracteres Invalidos" ValidationExpression="^[a-zA-Z ]*$" ControlToValidate="txtNombre"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lbNickName" runat="server" Text="Nombre de Usuario"></asp:Label>
            <asp:TextBox CssClass="imputs" ID="txtNickName" runat="server"></asp:TextBox>
            <div>
                <asp:RequiredFieldValidator Style="color: red" ID="vlNick" runat="server" ErrorMessage="Ingrese su Nick" ControlToValidate="txtNickName"></asp:RequiredFieldValidator>
            </div>
            <asp:RegularExpressionValidator ID="revNick" runat="server" Style="color: red" ErrorMessage="Caracteres Invalidos" ValidationExpression="^[a-zA-Z ]*$" ControlToValidate="txtNickName"></asp:RegularExpressionValidator>
            <asp:Label ID="lbMensajeNickName" runat="server" Text="El nombre de usuario ya esta ocupado" Visible="false" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lbCorreo" runat="server" Text="Correo Electronico"></asp:Label>
            <asp:TextBox CssClass="imputs" ID="txtCorreo" runat="server"></asp:TextBox>
            <div>
                <asp:RequiredFieldValidator Style="color: red" ID="vlCorreo" runat="server" ErrorMessage="Ingrese su Correo" ControlToValidate="txtCorreo"></asp:RequiredFieldValidator>
            </div>
            <asp:RegularExpressionValidator ID="rvmCorreo" runat="server" Style="color: red" ErrorMessage="Caracteres Invalidos" ValidationExpression="^[a-zA-Z ]*$" ControlToValidate="txtCorreo"></asp:RegularExpressionValidator>
            <asp:Label ID="lbMensajeCorreo" runat="server" Text="El ya esta registrado" Visible="false" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lbPassword" runat="server" Text="Password"></asp:Label>

            <asp:TextBox CssClass="imputs" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <div>
                <asp:RequiredFieldValidator Style="color: red" ID="vlPassword" runat="server" ErrorMessage="Ingrese su Contraseña" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </div>
            <asp:RegularExpressionValidator ID="revPassword" runat="server" Style="color: red" ErrorMessage="Caracteres Invalidos" ValidationExpression="^[a-zA-Z ]*$" ControlToValidate="txtPassword"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Button CssClass="boton" ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
            <asp:Button CssClass="boton" ID="Cancelar" runat="server" Text="Cancelar" />
            <br />
            <br />

        </div>
        <!-- /container -->
    </form>
</body>
</html>


