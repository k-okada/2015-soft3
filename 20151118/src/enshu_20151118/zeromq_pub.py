#!/usr/bin/env python

import zmq
import time
import random
context = zmq.Context()
 
publisher = context.socket (zmq.PUB)
publisher.bind ("tcp://127.0.0.1:8888")
 
while True:
    message1 = ("%d" % random.randint(1,10) + " + %d = " % random.randint(1,10))
    print(message1)
    message2 = raw_input('answer>>')
    publisher.send("%s" % message1 + "%s" % message2)
    time.sleep(0.2)
