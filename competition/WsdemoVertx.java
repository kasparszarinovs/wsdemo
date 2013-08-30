import org.vertx.java.core.Handler;
import org.vertx.java.core.buffer.Buffer;
import org.vertx.java.core.http.HttpServerRequest;
import org.vertx.java.core.http.ServerWebSocket;
import org.vertx.java.deploy.Verticle;

public class WsdemoVertx extends Verticle {

  public void start() {
    vertx.createHttpServer().websocketHandler(new Handler<ServerWebSocket>() {
      public void handle(final ServerWebSocket ws) {
        if (ws.path.equals("/")) {
          ws.dataHandler(new Handler<Buffer>() {
            public void handle(Buffer data) {
              ws.writeBuffer(data); // Echo it back
            }
          });
        } else {
          ws.reject();
        }
      }
    }).listen(8000);
  }
}