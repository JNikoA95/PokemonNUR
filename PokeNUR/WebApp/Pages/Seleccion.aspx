﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Seleccion.aspx.cs" Inherits="Pages_Seleccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Seleccion de pokemon </h1>
    <div class="container" id="container">

        <asp:LinkButton CssClass="links" ID="BtnLogout" runat="server" OnClick="BtnLogout_Click">Salir</asp:LinkButton>
        <br>
        <br>
        Elija un PokeHuevo
        <div class="huevo">
            <asp:Image CssClass="img-huevo" ID="pokemonIMG" runat="server" ImageUrl="../App_Themes/Style/img/1%20Charmander%20frente.gif"/>
        </div>

        <asp:RadioButtonList CssClass="cbox" ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem class="rb1" Selected="True">Fuego</asp:ListItem>
            <asp:ListItem class="rb2">Agua</asp:ListItem>
            <asp:ListItem class="rb3">Planta</asp:ListItem>
        </asp:RadioButtonList>

        <asp:Button CssClass="boton" ID="Button1" runat="server" Text="Hecho" OnClick="Button1_Click" />

    </div>
</asp:Content>

