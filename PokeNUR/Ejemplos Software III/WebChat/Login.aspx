<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
        <asp:LinkButton ID="LoginButton" runat="server" OnClick="LoginButton_Click" Text="Ingresar"></asp:LinkButton>
    </form>
</body>
</html>
