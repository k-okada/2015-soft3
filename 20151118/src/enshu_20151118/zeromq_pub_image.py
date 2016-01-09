#!/usr/bin/env python

import zmq
import time
import base64

context = zmq.Context()
 
publisher = context.socket (zmq.PUB)
publisher.bind ("tcp://127.0.0.1:8888")

f = open("dora.png","rb").read()
message = base64.b64encode(f)
print message

publisher.send("a")
time.sleep(1)
publisher.send(message)
