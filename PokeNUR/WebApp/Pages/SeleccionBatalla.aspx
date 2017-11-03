<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="SeleccionBatalla.aspx.cs" Inherits="Pages_SeleccionBatalla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Seleccione Tres Pokemons</h1>
    <div class="contenedor"> 
        <div class="misPokemones">
            <asp:GridView CssClass="listaPoke" ID="GridViewPokemones" runat="server"></asp:GridView>
            <asp:Button CssClass="boton" ID="ButtonHecho" runat="server" Text="Hecho" />
        </div>
    </div>
</asp:Content>

