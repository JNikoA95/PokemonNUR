<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="InvitacionBatalla.aspx.cs" Inherits="Pages_InvitacionBatalla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Invita a Batallar</h1>

    <div class="contenedor">

        <asp:Repeater ID="InvitacionesRep" runat="server" DataSourceID="odsusuarios">
            <ItemTemplate>
                <div class="notificacion" runat="server">
                    <img class="img-Notificacion" src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
                    <asp:Label CssClass="nombreJugador" runat="server" ID="Nombre" Text='<%#Eval("nickName") %>'></asp:Label>
                    <div class="contenedorInvitacion">
                        <asp:Button CssClass="botonGreen" ID="Invitar" runat="server" Text="Invitar" OnClick="Invitar_Click" />
                    </div>
                    <asp:Label ID="txtCorreo" runat="server" Visible="false" CommandArgument='<%#Eval("correo") %>'></asp:Label>
                    <asp:Label ID="txtId" runat="server" Visible="false" CommandArgument='<%#Eval("codigo_id") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="odsusuarios" runat="server" SelectMethod="GetUsuario" TypeName="UserDSTableAdapters.UsuariosTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" UpdateMethod="Update"></asp:ObjectDataSource>
    </div>
</asp:Content>

