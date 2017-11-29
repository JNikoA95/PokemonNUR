<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Seleccion.aspx.cs" Inherits="Pages_Seleccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Seleccion de pokemon </h1>
    <div class="container" id="container">
        
        <script type="text/javascript">

            var thecontents = new Array()

            thecontents[0] = '../App_Themes/Style/img/1%20Charmander%20frente.gif'
            thecontents[1] = '../App_Themes/Style/img/40%20Dugtrio%20frente.gif'
            thecontents[2] = '../App_Themes/Style/img/7%20Bulbasaur%20frente.gif'


            function cambia(which) {
                pokemon.src = thecontents[document.getElementById('RadioButtonList1').selectedIndex]
                document.container.contentbox.value = thecontents[document.getElementById('RadioButtonList1').selectedIndex]
            }
        </script>

        <asp:LinkButton CssClass="links" ID="BtnLogout" runat="server" OnClick="BtnLogout_Click">Salir</asp:LinkButton>
        <br><br>Elija un PokeHuevo
        <div class="huevo">
            <img class="img-huevo" id="pokemon" src="" />
        </div>
        <asp:RadioButtonList CssClass="cbox" ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="cambia()">
            <asp:ListItem class="rb1" Selected="True">Fuego</asp:ListItem>
            <asp:ListItem class="rb2">Agua</asp:ListItem>
            <asp:ListItem class="rb3">Planta</asp:ListItem>
        </asp:RadioButtonList>

        <asp:Button CssClass="boton" ID="Button1" runat="server" Text="Hecho" OnClick="Button1_Click" />

    </div>
</asp:Content>

