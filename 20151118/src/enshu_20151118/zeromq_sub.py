#!/usr/bin/env python

import zmq
import time
context = zmq.Context()
 
subscriber = context.socket (zmq.SUB)
subscriber.connect ("tcp://127.0.0.1:8888")
subscriber.setsockopt(zmq.SUBSCRIBE, "neuron1")

publisher = context.socket (zmq.PUB)
publisher.bind ("tcp://127.0.0.2:8888")


 
while True:
    sub_message = subscriber.recv()
    print sub_message
    pub_message = "neuron2"+str(10-int(sub_message[7]))
    publisher.send (pub_message)
    
