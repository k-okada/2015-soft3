#!/usr/bin/env python

import zmq
import time

context = zmq.Context()
 
publisher = context.socket (zmq.PUB)
publisher.bind ("tcp://127.0.0.1:8888")
subscriber = context.socket (zmq.SUB)
subscriber.connect("tcp://127.0.0.2:8888")
subscriber.setsockopt(zmq.SUBSCRIBE,"neruon2")

i = 0
while True:
    pub_message = str("neuron1") + str(i)
    publisher.send(pub_message)
    
    if i < 9 : 
        i = i + 1
    else :
        i = 0
    time.sleep(0.2)

