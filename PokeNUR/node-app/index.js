var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
  res.sendFile(__dirname + '/public/index.html');
});

io.on('connection', function(socket){
	console.log("connected: " +socket.id);

	socket.on('chat message', function(msg){
		io.emit('chat message', msg);
		console.log("emitiendo: "+ msg);
	});
});
http.listen(3000, function(){
  console.log('listening on *:3000');
});