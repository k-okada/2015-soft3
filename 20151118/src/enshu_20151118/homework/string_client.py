#
#   send_string client in Python
#   Connects REQ socket to tcp://localhost:5555
#   Sends "Input string." to server, expects string back
#   When receives "time", shows current time
#

import zmq
from datetime import datetime

context = zmq.Context()

#  Socket to talk to server
print("Connecting to hello world server...")
socket = context.socket(zmq.REQ)
socket.connect("tcp://localhost:5555")

#  Do 10 requests, waiting each time for a response
for request in range(10):
    print("Sending request %s ..." % request)
    socket.send(b"Input string.")

    #  Get the reply.
    message = socket.recv()
    if message=="time":
        print(datetime.now().strftime("%Y/%m/%d %H:%M:%S"))
    else:
        print("Received reply %s [ %s ]" % (request, message))
