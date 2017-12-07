<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Pokedex.aspx.cs" Inherits="Pages_Pokedex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="titleRed">Pokedex</h1>
       <div class="contenedor">
        <asp:Repeater ID="InvitacionesRep" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="pokemon" runat="server">
                    <img class="img-Pokemon" src="../App_Themes/Style/img/<%#Eval("nombre")%>%20frente.gif" />
                    <asp:Label CssClass="nombreJugador" runat="server" ID="Nombre" Text='<%#Eval("nombre") %>'></asp:Label>
                    <asp:Label CssClass="pokemonTipo" runat="server" ID="Label1" Text='<%#Eval("tipo") %>'></asp:Label>
                    </div>
            </ItemTemplate>
        </asp:Repeater>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PokeNUR_DBConnectionString %>" SelectCommand="get_PokemonYtipo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
</asp:Content>

