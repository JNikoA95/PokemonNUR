<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Usuario.aspx.cs" Inherits="Pages_Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Mi Informacion</h1>
    <div class="contenedor"> 
        <div class="usuario">
            <img class="imgUsuario" src="../App_Themes/Style/img/people.png"/>
            <asp:Label ID="Nombre" runat="server" Text="Nombre"></asp:Label>
            <asp:Label ID="CantidadPokemons" runat="server" Text="CantidadPokemons"></asp:Label>
            <asp:Label ID="Dinero" runat="server" Text="Dinero"></asp:Label>
        </div>
        <asp:Repeater ID="PokemonesRP" runat="server">
            <ItemTemplate>
                <div class="pokemonsUsuario">
                    <img src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
                    <asp:Label ID="Pokemon" runat="server" Text="Pokemon"></asp:Label>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

