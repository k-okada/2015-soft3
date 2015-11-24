#!/usr/bin/env python

import zmq
import time
context = zmq.Context()

publisher = context.socket (zmq.PUB)
publisher.bind ("tcp://127.0.0.1:8888")

ar = []
i = 0
while True:
    print(ar)
    publisher.send_pyobj (ar)
    i = i+1
    ar.append(i)
    time.sleep(0.2)
