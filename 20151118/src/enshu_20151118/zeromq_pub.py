#!/usr/bin/env python

import zmq
import time
context = zmq.Context()

publisher = context.socket(zmq.PUB)
publisher.bind("tcp://127.0.0.1:8888")

while True:
	message = raw_input("input>>")
	publisher.send(message)
	time.sleep(0.2)
