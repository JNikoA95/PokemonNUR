<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Pages_Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lbNombre" runat="server" Text="Nombre"></asp:Label>
    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lbNickName" runat="server" Text="Nombre de Usuario"></asp:Label>
    <asp:TextBox ID="txtNickName" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lbCorreo" runat="server" Text="Correo Electronico"></asp:Label>
    <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lbPassword" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
    <asp:Button ID="Cancelar" runat="server" Text="Cancelar" />
</asp:Content>

