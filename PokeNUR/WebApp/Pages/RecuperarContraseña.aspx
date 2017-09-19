<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecuperarContraseña.aspx.cs" Inherits="Pages_RecuperarContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox runat="server" ID="txtCorreo" placeholder="Correo Electronico"></asp:TextBox>
        <asp:Button runat="server" Text="Enviame el codigo" OnClick="Unnamed1_Click"/>
    </div>

    <div id="codigoValido">
        <asp:TextBox runat="server" ID="codigoR" placeholder="Codigo de Recuperacion"></asp:TextBox>
        <asp:Button runat="server" Text="Enviar el codigo" OnClick="Unnamed2_Click" ID="codigo"/>
    </div>

    <div id="NuevaContraseña">
        <asp:TextBox runat="server" type="password" ID="contraseñaNueva" placeholder="Ingrese Nueva Contraseña"></asp:TextBox>
        <asp:Button runat="server" Text="Enviame el codigo" OnClick="Unnamed3_Click" Enabled="false" ID="nueva"/>
    </div>
    </form>
</body>
</html>
