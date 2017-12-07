<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="InvitacionBatalla.aspx.cs" Inherits="Pages_InvitacionBatalla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Invita a Batallar</h1>

    <div class="contenedor">
        <asp:Repeater ID="InvitacionesRep" runat="server" OnItemCommand="InvitacionesRep_ItemCommand">
            <ItemTemplate>
                <div class="notificacion" runat="server">
                    <img class="img-Notificacion" src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
                    <asp:Label CssClass="nombreJugador" runat="server" ID="Nombre" Text='<%#Eval("nickName") %>'></asp:Label>
                    <div class="contenedorInvitacion">
                        <asp:Button CssClass="botonGreen" ID="Invitar"  runat="server" Text="Invitar" CommandArgument='<%#Eval("nickName") %>' CommandName="Jugador" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>


</asp:Content>

