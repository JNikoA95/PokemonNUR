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
                <asp:Image CssClass="img-local" ID="pokemonLocal" runat="server" />
            </div>

            <div class="pokemonVisita">
                <asp:Image CssClass="img-visita" ID="pokemonVisita" runat="server" />
            </div>
        </div>

        <div class="opciones">
            <div class="ataquesBatalla">
                Ataques<br>
                <input class="boton" onclick="registrar()" id="Ataque1" type="button" value="Ataque1" runat="server" />
                <input class="boton" onclick="registrar()" id="Ataque2" type="button" value="Ataque2" runat="server" />
                <input class="boton" onclick="registrar()" id="Ataque3" type="button" value="Ataque3" runat="server" />
                <input class="boton" onclick="registrar()" id="Ataque4" type="button" value="Ataque4" runat="server" />
               

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

        <asp:HiddenField ID="txtPokemon_id" runat="server" />
        <asp:TextBox ID="User1" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtAtaque1" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtAtaque2" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtAtaque3" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtAtaque4" runat="server" Visible="false"></asp:TextBox>
        <asp:HiddenField ID="txtBatalla_id" runat="server" />
        <asp:HiddenField ID="SocketServer" runat="server" />

        <asp:Literal ID="socketIoScript" runat="server"></asp:Literal>
        <script =""></script>
        <script type="text/javascript">

            function a() { console.log("Holi"); }
            function registrar() {
               
                var socket = io($("#<%= SocketServer.ClientID %>").val() + "?batallaId=" + $("#<%= txtBatalla_id.ClientID %>").val());
                socket.on('send', function (data) {
                    console.log("llegando nuevo mensaje: " + data.msg);

                    var username = $("#<%= User1.ClientID %>").val();
                    var e = $('<div>').text(data.msg).addClass(username == data.sender ? "text-right" : "text-left");
                        $('#mensajes').append(e);
               });

               var idBatalla = $("#<%= txtBatalla_id.ClientID %>").val();
                    var idPokemon = $("#<%= txtPokemon_id.ClientID %>").val();
                    var params = { batalla_id: 0, pokemon_id: 0, ataque_id: 2, daño: 50 };

                    $.ajax({
                        type: "POST",
                        url: "Batallas.aspx/guardarDetalleBatalla",
                        data: JSON.stringify(params),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            alert("entra al succes");
                            if (!response || !response.d)
                                return;
                            socket.emit("msg", {
                                batalla_id: idBatalla,
                                pokemon_id: idPokemon,
                                ataque_id: 2,
                                daño: 50,
                                sender: $("#<%= User1.ClientID %>").val(),
                                success: function () {
                                    alert("belleza!!");
                                },
                                failure: function () {
                                    alert("no belleza");
                                }
                            });
                        },
                        failure: function (response) {
                            alert("VALISTE VERGA :v");
                        }
                    });
            }





        </script>

    </div>
</asp:Content>

