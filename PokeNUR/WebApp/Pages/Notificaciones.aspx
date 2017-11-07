<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Notificaciones.aspx.cs" Inherits="Pages_Notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Notificaciones</h1>
    <div class="contenedor">
        <div class="notificacion">
            <img src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
            <asp:Label ID="Nombre" runat="server" Text="Jugador"></asp:Label>
            <asp:Button CssClass="boton" ID="Aceptar" runat="server" Text="Aceptar" />
            <asp:Button CssClass="boton" ID="Rechazar" runat="server" Text="Rechazar" />
        </div>
        <asp:Repeater ID="NotificacionesRep" runat="server">
            <ItemTemplate>
                <div class="notificacion">
                    <img src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
                    <asp:Label ID="Nombre" runat="server" Text="Jugador"></asp:Label>
                    <asp:Button CssClass="botonGreen" ID="Aceptar" runat="server" Text="Aceptar" />
                    <asp:Button CssClass="botonRed" ID="Rechazar" runat="server" Text="Rechazar" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

