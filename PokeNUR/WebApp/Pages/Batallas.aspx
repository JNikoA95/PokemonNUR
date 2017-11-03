<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Batallas.aspx.cs" Inherits="Pages_Batallas" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Batalla</h1>
    <div class="contenedor">
        <div class="barras">
            <div class="local">
                <asp:Label ID="NombreLocal" runat="server" Text="Local"></asp:Label>
                <div class="LifeBar"></div>
                <div class="ExperienceBar"></div>
            </div>
            <h1 class="vs">Vs</h1>
            <div class="visita">
                <asp:Label ID="NombreVisita" runat="server" Text="Visita"></asp:Label>
                <div class="LifeBar" style="background-color: green;"></div>
                <div class="ExperienceBar" style="background-color: Blue;"></div>
            </div>
        </div>
        <div class="pokemonBatalla">
            <div class="pokemonLocal">
                <img src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
            </div>

            <div class="pokemonVisita">
                <img src="../App_Themes/Style/img/people.png" style="height: 147px; width: 148px" />
            </div>
        </div>

        <div class="opciones">
            <div class="ataquesBatalla">
                Ataques<br>
                <asp:Button CssClass="boton" ID="Ataque1" runat="server" Text="Ataque1" />
                <asp:Button CssClass="boton" ID="Ataque2" runat="server" Text="Ataque2" />
                <asp:Button CssClass="boton" ID="Ataque3" runat="server" Text="Ataque3" />
                <asp:Button CssClass="boton" ID="Ataque4" runat="server" Text="Ataque4" />
            </div>
            <div class="menuBatalla">
                Opciones<br>
                <asp:Button CssClass="boton" ID="Item" runat="server" Text="Item" />
                <asp:Button CssClass="boton" ID="Pokemon" runat="server" Text="Pokemon" />
                <div class="detallesBatalla">
                    <asp:GridView ID="GridViewDatosBatalla" runat="server"></asp:GridView>
                </div>
            </div>

        </div> 

    </div>
</asp:Content>

