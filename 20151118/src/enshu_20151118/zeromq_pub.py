#!/usr/bin/env python

import zmq
import time
context = zmq.Context()
 
publisher = context.socket (zmq.PUB)
publisher.bind ("tcp://127.0.0.1:8888")

f.open("dora.png","r") 
message = s
    publisher.send (message)
    i = 0 if ( i >= 10) else i + 1
    time.sleep(0.1)
