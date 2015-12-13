#
#   send_string server in Python
#   Binds REP socket to tcp://*:5555
#   Expects b"Input string." from client, replies with string
#

#import time
import zmq

context = zmq.Context()
socket = context.socket(zmq.REP)
socket.bind("tcp://*:5555")

while True:
    #  Wait for next request from client
    message = socket.recv()
    print("Received request: %s" % message)

    #  Do some 'work'
    #time.sleep(1)
    msg=raw_input("send :")
    #  Send reply back to client
    socket.send(msg)
