﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Prueba.aspx.cs" Inherits="Pages_Prueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<script src="/socket.io/socket.io.js"></script>--%>
    <%--<script src="node_modules/engine.io/lib/transports/polling-xhr.js"></script>--%>
    <script src="node_modules/socket.io-client/dist/socket.io.js"></script>
    <script src="node_modules/engine.io-client/lib/transports/polling-xhr.js"></script>
    <script src="node_modules/socket.io/lib/socket.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script>
        var socket = io.connect('http://localhost:61341');

        // on connection to server, ask for user's name with an anonymous callback
        socket.on('connect', function () {
            // call the server-side function 'adduser' and send one parameter (value of prompt)
            socket.emit('adduser', prompt("What's your name?"));
        });

        // listener, whenever the server emits 'updatechat', this updates the chat body
        socket.on('updatechat', function (username, data) {
            $('#conversation').append('<b>' + username + ':</b> ' + data + '<br>');
        });

        // listener, whenever the server emits 'updaterooms', this updates the room the client is in
        socket.on('updaterooms', function (rooms, current_room) {
            $('#rooms').empty();
            $.each(rooms, function (key, value) {
                if (value == current_room) {
                    $('#rooms').append('<div>' + value + '</div>');
                }
                else {
                    $('#rooms').append('<div><a href="#" onclick="switchRoom(\'' + value + '\')">' + value + '</a></div>');
                }
            });
        });

        function switchRoom(room) {
            socket.emit('switchRoom', room);
        }

        // on load of page
        $(function () {
            // when the client clicks SEND
            $('#datasend').click(function () {
                var message = $('#data').val();
                $('#data').val('');
                // tell server to execute 'sendchat' and send along one parameter
                socket.emit('sendchat', message);
            });

            // when the client hits ENTER on their keyboard
            $('#data').keypress(function (e) {
                if (e.which == 13) {
                    $(this).blur();
                    $('#datasend').focus().click();
                }
            });
        });

    </script>
    <div style="float: left; width: 100px; border-right: 1px solid black; height: 300px; padding: 10px; overflow: scroll-y;">
        <b>ROOMS</b>
        <div id="rooms"></div>
    </div>
    <div style="float: left; width: 300px; height: 250px; overflow: scroll-y; padding: 10px;">
        <div id="conversation"></div>
        <input id="data" style="width: 200px;" />
        <input type="button" id="datasend" value="send" />
    </div>

</asp:Content>

