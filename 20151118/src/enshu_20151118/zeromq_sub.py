#!/usr/bin/env python

import zmq
import time
context = zmq.Context()
 
subscriber = context.socket (zmq.SUB)
subscriber.connect ("tcp://127.0.0.1:8888")
subscriber.setsockopt(zmq.SUBSCRIBE, "")
 
while True:
    message = subscriber.recv()
    messages = message.split()
    int1 = int(messages[0])
    int2 = int(messages[2])
    answer = int1+int2
    int3 = int(messages[4])
    if int3 == answer :
        print ('true')
    else:
        print ('wrong')
