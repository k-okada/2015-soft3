#!/usr/bin/env python

import zmq
import time

context = zmq.Context()
 
subscriber = context.socket (zmq.SUB)
subscriber.connect ("tcp://127.0.0.2:8888")
subscriber.setsockopt(zmq.SUBSCRIBE, "neuron2")


i=0
while True:

    sub_message = subscriber.recv()
    print sub_message
#    time.sleep(0.2)

#    print message

