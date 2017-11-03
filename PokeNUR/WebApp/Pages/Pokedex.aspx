<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Pokedex.aspx.cs" Inherits="Pages_Pokedex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="titleRed">Pokedex</h1>
    <div class="contenedor">
        <div class="pokemon">
            <img src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
            <asp:Label ID="Pokemon" runat="server" Text="Pokemon"></asp:Label>
            <asp:Label ID="Tipo" runat="server" Text="Tipo"></asp:Label>
            <asp:Label ID="Evoluciones" runat="server" Text="Evoluciones"></asp:Label>
        </div>
        <asp:Repeater ID="InvitacionesRep" runat="server">
            <ItemTemplate>
                <div class="invitacion">
                    <img src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
                    <asp:Label ID="Pokemon" runat="server" Text="Pokemon"></asp:Label>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

