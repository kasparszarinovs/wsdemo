import vertx

server = vertx.create_http_server()

@server.websocket_handler
def websocket_handler(ws):
    def data_handler(buffer):
        ws.write_buffer(buffer)
    ws.data_handler(data_handler)

server.listen(8000)