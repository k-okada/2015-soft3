#!/usr/bin/env python

import zmq
import time
context = zmq.Context()
 
subscriber = context.socket (zmq.SUB)
subscriber.connect ("tcp://127.0.0.1:8888")
subscriber.setsockopt(zmq.SUBSCRIBE, "to:taro")
 
while True:
    message = subscriber.recv().split("@")
    print message[1]
