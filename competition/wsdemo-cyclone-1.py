import cyclone.escape
import cyclone.web
import cyclone.websocket
import sys
from twisted.python import log
from twisted.internet import reactor


class EchoApp(cyclone.web.Application):
    def __init__(self):
        settings = dict(
            cookie_secret="43oETzKXQAGaYdkL5gEmGeJJFuYh7EQnp2XdTP1o/Vo=",
            xsrf_cookies=True,
            autoescape=None,
        )

        handlers = [
            (r"/", EchoSocketHandler),
        ]

        cyclone.web.__init__(self, handlers, **settings)


class EchoSocketHandler(cyclone.websocket.WebSocketHandler):
    def messageReceived(self, message):
        self.sendMessage(message)


def main():
    reactor.listenTCP(8000, EchoApp())
    reactor.run()

if __name__ == "__main__":
    log.startLogging(sys.stdout)
    main()
