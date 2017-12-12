<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Batallas.aspx.cs" Inherits="Pages_Batallas" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Batalla</h1>
    <div class="contenedor">

        <div class="barras">
            <div class="local">
                <asp:Label CssClass="nombres" ID="NombreLocal" runat="server" Text="Local"></asp:Label>
                <progress class="LifeBar"></progress>
                <progress class="ExperienceBar"></progress>
            </div>
            <h1 class="vs">Vs</h1>
            <div class="visita">
                <asp:Label CssClass="nombres" ID="NombreVisita" runat="server" Text="Visita"></asp:Label>
                <progress class="LifeBar" style="background-color: green;"></progress>
                <progress class="ExperienceBar" style="background-color: Blue;"></progress>
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
                <input class="boton" id="Ataque1" type="button" value="Ataque1" runat="server" />
                <input class="boton" id="Ataque2" type="button" value="Ataque2" runat="server" />
                <input class="boton" id="Ataque3" type="button" value="Ataque3" runat="server" />
                <input class="boton" id="Ataque4" type="button" value="Ataque4" runat="server" />


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
        <div style="color: white; text-align: left" id="mensajes">
            <asp:Repeater ID="ChatsRepeater" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="MsgPanel" runat="server" CssClass='<%# Eval("jugador_id").ToString() == User1.Value ? "text-right" : "text-left" %>'>
                        <asp:Literal ID="MsgLiteral" runat="server">'></asp:Literal>
                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <asp:HiddenField ID="txtPokemon_id" runat="server" />
        <asp:HiddenField ID="User1" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="txtAtaque1" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="txtAtaque2" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="txtAtaque3" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="txtAtaque4" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="txtBatalla_id" runat="server" />
        <asp:HiddenField ID="SocketServer" runat="server" />

        <asp:HiddenField ID="OponeneID" runat="server" />
        <asp:HiddenField ID="AtaqueOponenteID" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="PokemonOponenteID" runat="server"></asp:HiddenField>

        <asp:Literal ID="socketIoScript" runat="server"></asp:Literal>

        <script type="text/javascript">
            var socket = io($("#<%= SocketServer.ClientID %>").val() + "?batallaId=" + $("#<%= txtBatalla_id.ClientID %>").val());
            var ataque = $("#<%= Ataque2.ClientID %>").val();
            $(document).ready(function () {
                socket.on('send', function (data) {
                    console.log("llegando nuevo mensaje: " + JSON.stringify(data.msg));
                    console.log("pokemon: " + data.msg.pokemon_id);
                    if ($("#<%= User1.ClientID %>").val() != data.msg.usuario) {
                        $("#<%= OponeneID.ClientID %>").val(data.msg.usuario);
                        $("#<%= PokemonOponenteID.ClientID %>").val(data.msg.pokemon_id);
                        $("#<%= AtaqueOponenteID.ClientID %>").val(data.msg.ataque_id);
                    }
                    console.log("usr: " + $("#<%= OponeneID.ClientID %>").val());
                    var username = $("#<%= User1.ClientID %>").val();
                    var e = $('<div>').text(JSON.stringify(data.msg.ataque_id)).addClass(username == data.sender ? "text-right" : "text-left");
                    $('#mensajes').append(e);
                });
            });

            function registrar(idAtaque, danho) {

                var idBatalla = $("#<%= txtBatalla_id.ClientID %>").val();
                var idPokemon = $("#<%= txtPokemon_id.ClientID %>").val();
                var username = $("#<%= User1.ClientID %>").val();
                var params = { batalla_id: 0, usuario: username, pokemon_id: 0, ataque_id: idAtaque, daño: danho };

                $.ajax({
                    type: "POST",
                    url: "Batallas.aspx/guardarDetalleBatalla",
                    data: JSON.stringify(params),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (!response || !response.d)
                            return;
                        socket.emit("msg", {
                            batalla_id: idBatalla,
                            msg: { "batalla_id": idBatalla, "usuario": username, "pokemon_id": idPokemon, "ataque_id": idAtaque, "daño": danho },
                            sender: username
                        });
                    },
                    failure: function (response) {
                        alert("FALLO");
                    }
                });
            }


            function pokemonJugador() {

                var idPokemon = $("#<%= txtPokemon_id.ClientID %>").val();
                var username = $("#<%= User1.ClientID %>").val();
                var params = { batalla_id: 0, usuario: username, pokemon_id: 0};

                $.ajax({
                    type: "POST",
                    url: "Batallas.aspx/guardarDetalleBatalla",
                    data: JSON.stringify(params),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (!response || !response.d)
                            return;
                        socket.emit("msg", {
                            batalla_id: idBatalla,
                            msg: { "batalla_id": idBatalla, "usuario": username, "pokemon_id": idPokemon},
                            sender: username
                        });
                    },
                    failure: function (response) {
                        alert("FALLO");
                    }
                });
            }

        </script>
    </div>
</asp:Content>

