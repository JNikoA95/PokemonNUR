<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecuperarContraseña.aspx.cs" Inherits="Pages_RecuperarContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../App_Themes/Style/Style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div runat="server" id="campoCorreo">
                <asp:TextBox CssClass="imputs" runat="server" ID="txtCorreo" placeholder="Correo Electronico"></asp:TextBox>
                <asp:Button CssClass="boton1" runat="server" Text="Enviame el codigo" OnClick="Unnamed1_Click" />
            </div>

            <div runat="server" id="codigoValido" visible="false">
                <asp:TextBox CssClass="imputs" runat="server" ID="codigoR" placeholder="Codigo de Recuperacion"></asp:TextBox>
                <asp:Button CssClass="boton1" runat="server" Text="Enviar el codigo" OnClick="Unnamed2_Click" ID="codigo" />
                <br />
                <asp:Label runat="server" ForeColor="Red">El codigo sera valido solo por 10min.</asp:Label>

            </div>

            <div runat="server" id="contr" visible="false">
                <asp:TextBox CssClass="imputs" runat="server" type="password" ID="contraseñaNueva" placeholder="Ingrese Nueva Contraseña"></asp:TextBox>
                <asp:Button CssClass="boton1" runat="server" Text="Enviame el codigo" OnClick="Unnamed3_Click" ID="nueva" />
            </div>
        </div>
    </form>
</body>
</html>
