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
                <asp:Image CssClass="img-huevo" ID="pokemonLocal" runat="server"/>
            </div>

            <div class="pokemonVisita">
                <asp:Image CssClass="img-huevo" ID="pokemonVisita" runat="server"/>
            </div>
        </div>

        <div class="opciones">
            <div class="ataquesBatalla">
                Ataques<br>
                <input class="boton" id="Ataque1" type="button" value="Ataque1" runat="server"/>
                <input class="boton" id="Ataque2" type="button" value="Ataque2" runat="server"/>
                <input class="boton" id="Ataque3" type="button" value="Ataque3" runat="server"/>
                <input class="boton" id="Ataque4" type="button" value="Ataque4" runat="server"/>
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

        <asp:TextBox ID="txtPokemon_id" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="User1" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtAtaque1" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtAtaque2" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtAtaque3" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtAtaque4" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtBatalla_id" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="SocketServer" runat="server" Visible="false"></asp:TextBox>
        
        <asp:Literal ID="socketIoScript" runat="server"></asp:Literal>
        <script type="text/javascript">

            $(document).ready(function () {
                var socket = io($("#<%= SocketServer.ClientID %>").val() + "?batalaId=" + $("#<%= txtBatalla_id.ClientID %>").val());
                socket.on('send', function (data) {
                    console.log("llegando nuevo mensaje: " + data.msg);

                    var username = $("#<%= User1.ClientID %>").val();
                    var e = $('<div>').text(data.msg).addClass(username == data.sender ? "text-right" : "text-left");
                    $('#Ataque1').append(e);
                });


                $("#Ataque1").click(function () {
                    var usuario = $("#<%= User1.ClientID %>").val();
                    var ataque = $("#<%= txtAtaque1.ClientID %>").val();
                    var batalla = $("#<%= txtAtaque1.ClientID %>").val();
                    if ($.trim(mensaje) == "")
                        return;

                    var conversacionId = $("#<%= txtBatalla_id.ClientID %>").val();
                    //Llamar al webmethod
                    var param = {
                        
                    };

                    $.ajax({
                        type: "POST",
                        url: "Chat.aspx/GuardarMensaje",
                        data: JSON.stringify(param),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (!response || !response.d)
                                return;

                            socket.emit("msg", {
                                conversacionId: conversacionId,
                                msg: mensaje,
                                sender: username
                            });
                            <%--$("#<%= MensajeTextBox.ClientID %>").val("");--%>
                        },
                        failure: function (response) {
                            console.log("Error al enviar datos al servidor");
                        }
                    });


                });

            });

        </script>

    </div>
</asp:Content>

