var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket){
	
	
	
	var query = socket.handshake.query;
	var conversacionId = query.conversacionId;

	conversacionId = 'conversacion-' + conversacionId
	socket.join(conversacionId);
	
	
	console.log('a user connected to ' + conversacionId);
	
	socket.on('msg', function (data) {

	    var room = 'conversacion-' + data.conversacionId
	    /* data = {
	        conversacionId : 1,
            msg : "Hola"
	    }*/

	    console.log("enviando mensaje en el Room : " + room);
	    io.to(room).emit('send', { msg: data.msg, sender: data.sender });
	});
	

	socket.on('disconnect', function(){
		
		
		console.log("Disconnected...");
	});
});

	

http.listen(3000, function(){
  console.log('listening on *:3000');
});