#
#   Count Digits client in Python
#   Connects REQ socket to tcp://localhost:5555
#   Sends an integar to server, expects the number of digits(of its factorial) back
#

import zmq
import random

context = zmq.Context()

#  Socket to talk to server
print("Connecting to hello world server...")
socket = context.socket(zmq.REQ)
socket.connect("tcp://localhost:5555")

#  Do 3 requests, waiting each time for a response
for request in range(3):
    one_num = random.randint(5,15)
    print("Sending request_%s ..." % request)
    socket.send("%d" % one_num)

    #  Get the reply.
    ret_digit = int(socket.recv())
    print("Received reply %s [ %s ]" % (one_num, ret_digit))
