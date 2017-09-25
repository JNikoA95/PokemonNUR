<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Seleccion.aspx.cs" Inherits="Pages_Seleccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Seleccion de pokemon
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            Elija un PokeHuevo
        <div class="fuego">
            <asp:Image ID="fuego" runat="server" />
        </div>
        <div class="agua">
            <asp:Image ID="Image2" runat="server" />
        </div>
        <div class="planta">
            <asp:Image ID="Image3" runat="server" />
        </div>
        <asp:RadioButtonList CssClass="cbox" ID="RadioButtonList1" runat="server" Height="64px" Width="104px">
            <asp:ListItem>Fuego</asp:ListItem>
            <asp:ListItem>Agua</asp:ListItem>
            <asp:ListItem>Planta</asp:ListItem>
        </asp:RadioButtonList>
        
        <asp:Button CssClass="btnSeleccion" ID="Button1" runat="server" Text="Hecho" OnClick="Button1_Click" />
</asp:Content>

