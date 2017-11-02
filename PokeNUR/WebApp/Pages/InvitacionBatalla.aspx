<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="InvitacionBatalla.aspx.cs" Inherits="Pages_InvitacionBatalla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Invita a Batallar</h1>
    <div class="contenedor">
        <div class="invitacion">
            <img src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
            <asp:Label ID="Nombre" runat="server" Text="Jugador"></asp:Label>
            <asp:Button CssClass="boton" ID="Invitar" runat="server" Text="Invitar" />
        </div>
        <asp:Repeater ID="InvitacionesRep" runat="server">
            <ItemTemplate>
                <div class="invitacion">
                    <img src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
                    <asp:Label ID="Nombre" runat="server" Text="Jugador"></asp:Label>
                    <asp:Label ID="Estado" runat="server" Text="Estado"></asp:Label>
                    <asp:Button CssClass="boton" ID="Invitar" runat="server" Text="Invitar" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

