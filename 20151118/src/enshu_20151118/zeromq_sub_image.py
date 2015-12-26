#!/usr/bin/env python

import zmq
import time
import base64
context = zmq.Context()
 
subscriber = context.socket (zmq.SUB)
subscriber.connect ("tcp://127.0.0.1:8888")
subscriber.setsockopt(zmq.SUBSCRIBE, "")


while True:
    message = subscriber.recv()
    message_dec = base64.b64decode(message)
    f = open("dora_rec.png","wb") 
    f.write(message_dec)
    f.close()
    print message
