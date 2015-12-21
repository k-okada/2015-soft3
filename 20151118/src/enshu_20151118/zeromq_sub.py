#!/usr/bin/env python

import zmq
import time

context = zmq.Context()
 
publisher = context.socket (zmq.PUB)
publisher.bind("tcp://127.0.0.2:8888")
subscriber = context.socket (zmq.SUB)
subscriber.connect ("tcp://127.0.0.1:8888")
subscriber.setsockopt(zmq.SUBSCRIBE, "neuron1")

j=0
while True:
    pub_message = str("neuron2") + str(j)
    publisher.send(pub_message)
    sub_message = subscriber.recv()
    print sub_message
    j = sub_message[7]
    j = 9 - int(j)
#    time.sleep(0.2)

#    print message

