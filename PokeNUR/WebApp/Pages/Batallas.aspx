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
                <input class="boton" id="Ataque1" type="button" value="Ataque1" />
                <input class="boton" id="Ataque2" type="button" value="Ataque2" />
                <input class="boton" id="Ataque3" type="button" value="Ataque3" />
                <input class="boton" id="Ataque4" type="button" value="Ataque4" />
            </div>
            <div class="menuBatalla">
                Opciones<br>
                <input class="boton" id="Item" type="button" value="Item" />
                <input class="boton" id="Pokemon" type="button" value="Pokemon" />
                <div class="detallesBatalla">
                    <asp:GridView ID="GridViewDatosBatalla" runat="server"></asp:GridView>
                </div>
            </div>
        </div>

        <%--<script type="text/javascript">
            function registrarAtaque() {
                var name = document.getElementById('<%=txtNombre.ClientID%>').value;
                var username = document.getElementById('<%=txtUsuario.ClientID%>').value;
                var pass = document.getElementById('<%=txtPassword.ClientID%>').value;
                var params = { nombre: name, pass: pass, username: username };
                $.ajax({
                    type: "POST",
                    url: "Batalla.aspx/guardarDetalleBatalla",
                    data: JSON.stringify(params),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert('Registro Correcto!! :D');
                        window.location.href = "Login.aspx";
                    },
                    failure: function (response) {
                        alert("algo salio mal");
                    }
                });
            }
        </script>--%>

    </div>
</asp:Content>

