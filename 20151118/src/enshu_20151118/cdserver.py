#
#   Count Digits server in Python
#   Binds REP socket to tcp://*:5555
#   Expects an integar from client, replies with the number of digits(of its factorial)
#

import time
import zmq
import math

context = zmq.Context()
socket = context.socket(zmq.REP)
socket.bind("tcp://*:5555")

while True:
    #  Wait for next request from client
    one_num = int(socket.recv())
    print("Received request: %d" % one_num)

    #  Estimate the digits of its factorial
    fact_num = math.factorial(one_num)
    # print("%d" % fact_num)
    num_digit = int(math.log10(fact_num) + 1)

    #  Send reply back to client
    socket.send("%d" % num_digit)
