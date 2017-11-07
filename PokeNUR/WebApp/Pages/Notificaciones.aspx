<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Notificaciones.aspx.cs" Inherits="Pages_Notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Notificaciones</h1>
    <div class="contenedor">

        <%--<div class="notificacion">
            <img class="img-Notificacion" src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
            <asp:Label CssClass="nombreJugador" ID="Nombre" runat="server" Text="Jugador"></asp:Label>
            <div class="contenedorBotones">
                <asp:Button CssClass="botonGreen" ID="Aceptar" runat="server" Text="Aceptar" />
                <asp:Button CssClass="botonRed" ID="Rechazar" runat="server" Text="Rechazar" />
            </div>
        </div>--%>
        <asp:Repeater ID="NotificacionesRep" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="NotificacionesRep_ItemCommand">
            <ItemTemplate>
                <div class="notificacion">
                    <img class="img-Notificacion" src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
                    <asp:Label CssClass="nombreJugador" ID="Nombre" runat="server" Text='<%#Eval ("nickname2")%>'></asp:Label>
                    <div class="contenedorBotones">
                        <asp:Button CssClass="botonGreen" ID="Aceptar" runat="server" Text="Aceptar" />
                        <asp:Button CssClass="botonRed" ID="Rechazar" runat="server" Text="Rechazar" />
                    </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="upd_getDatosBatalla" TypeName="BatallaDSTableAdapters.BatallasTableAdapter">
            
            <SelectParameters>
                <asp:QueryStringParameter runat="server" QueryStringField="ID" Name="idJugador" Type="Int32" DefaultValue="0"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

