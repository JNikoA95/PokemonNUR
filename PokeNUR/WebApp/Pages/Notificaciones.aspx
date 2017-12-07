<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Notificaciones.aspx.cs" Inherits="Pages_Notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Notificaciones</h1>

    <div class="contenedor">
        <asp:Repeater ID="NotificacionesRep" runat="server" OnItemCommand="NotificacionesRep_ItemCommand">
            <ItemTemplate>
                <div class="notificacion">
                    <img class="img-Notificacion" src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
                    <asp:Label CssClass="nombreJugador" ID="Nombre" runat="server" Text='<%#Eval ("jugador_1")%>'></asp:Label>
                    

                    <div class="contenedorBotones">
                        <asp:Button CssClass="botonGreen" ID="Aceptar" runat="server" Text="Aceptar" CommandArgument='<%#Eval("Codigo_id")%>' CommandName="Batalla"/>
                        <asp:Button CssClass="botonRed" ID="Rechazar" runat="server" Text="Rechazar" />
                    </div>
                    </div>
            </ItemTemplate>
        </asp:Repeater>
        
    </div>
</asp:Content>

