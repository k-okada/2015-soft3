#!/usr/bin/env python

import zmq
import time
context = zmq.Context()
 
publisher = context.socket (zmq.PUB)
publisher.bind ("tcp://127.0.0.1:8888")

print "your name >"
se=raw_input()

while True:
    print "to: >"
    re=raw_input()
    print "enter massage >"
    text=raw_input()
    message = "to:"+re+"@"+"message from:"+se+">>\n"+text
    publisher.send (message)
    time.sleep(0.2)
