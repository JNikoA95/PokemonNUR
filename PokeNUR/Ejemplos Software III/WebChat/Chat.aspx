<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>

<!DOCTYPE html>

<html >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        html, body, form{
            height: 100%;
        }
        #mensajes{
            height: 80%;
            overflow:auto;
        }
        .txt-msg{
            height: 19%;
            overflow: hidden;
            width: 100%;
        }

        .txt-msg textarea{
            height: 100%;
        }

        .btn{
            float:right;
            width: 9%;
            display:inline-block;   
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mensajes">
            <asp:Repeater ID="ChatsRepeater" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="MsgPanel" runat="server" CssClass='<%# Eval("username").ToString() == User1.Value ? "text-right" : "text-left" %>'>
                        <asp:Literal ID="MsgLiteral" runat="server" Text='<%# Eval("mensaje") %>'></asp:Literal>
                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="txt-msg">
            <asp:TextBox ID="MensajeTextBox" runat="server" CssClass="" TextMode="MultiLine" Width="90%"></asp:TextBox>
            <input type="button" id="enviar" class="btn btn-primary" value="Enviar" />
        </div>
        <asp:HiddenField ID="ConversacionId" runat="server" />
        <asp:HiddenField ID="User1" runat="server" />
        <asp:HiddenField ID="User2" runat="server" />
        <asp:HiddenField ID="SocketServer" runat="server" />

        <asp:Literal ID="socketIoScript" runat="server"></asp:Literal>
        <script type="text/javascript">

            $(document).ready(function () {
                var socket = io($("#<%= SocketServer.ClientID %>").val() + "?conversacionId=" + $("#<%= ConversacionId.ClientID %>").val());
                socket.on('send', function (data) {
                    console.log("llegando nuevo mensaje: " + data.msg);

                    var username = $("#<%= User1.ClientID %>").val();
                    var e = $('<div>').text(data.msg).addClass( username == data.sender ? "text-right" : "text-left");
                    $('#mensajes').append(e);
                });


                $("#enviar").click(function () {
                    var username = $("#<%= User1.ClientID %>").val();
                    var mensaje = $("#<%= MensajeTextBox.ClientID %>").val();
                    if($.trim(mensaje) == "")
                        return;

                    var conversacionId = $("#<%= ConversacionId.ClientID %>").val();
                    //Llamar al webmethod
                    var param = {
                        userName: username,
                        msg: mensaje,
                        conversacionId: conversacionId
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
                            $("#<%= MensajeTextBox.ClientID %>").val("");
                        },
                        failure: function(response) {
                            console.log("Error al enviar datos al servidor");
                        }
                    });

                    
                });

            });

        </script>
    </form>
</body>
</html>
