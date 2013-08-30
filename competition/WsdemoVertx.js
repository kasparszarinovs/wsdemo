load('vertx.js');

vertx.createHttpServer().websocketHandler(function(ws) {
  ws.dataHandler( function(buffer) { ws.writeBuffer(buffer) });
}).listen(8000);