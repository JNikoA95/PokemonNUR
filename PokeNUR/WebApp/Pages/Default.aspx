<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="titleRed">Estas Saliendo del juego</h1>
    <div class="container">
        <asp:Button CssClass="botonGreen" ID="BtnLogout" runat="server" OnClick="BtnLogout_Click" Text="Aceptar" />
        <asp:Button CssClass="botonRed" ID="Rechazar" runat="server" OnClick="BtnCancel_Click" Text="Rechazar" />
    </div>
</asp:Content>

