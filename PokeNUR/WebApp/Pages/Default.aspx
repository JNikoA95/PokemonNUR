<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Bienvenido a las Batallas Pokemon!</h1>
        <asp:LinkButton ID="BtnLogout" runat="server" OnClick="BtnLogout_Click" >Salir</asp:LinkButton>

</asp:Content>

