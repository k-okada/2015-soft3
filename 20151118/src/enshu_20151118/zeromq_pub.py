#!/usr/bin/env python

import zmq
import time
context = zmq.Context()
 
publisher = context.socket (zmq.PUB)
publisher.bind ("tcp://127.0.0.1:8888")
 
i = 0

print "Are you hungry?"
yesorno = raw_input()

while True:
    if yesorno == yes:
        message = "The publisher is hungry."
    elif yesorno == no:
        message = "The publisher is not hungry."
    else:
        message = "The publisher is crazy."
    
    print(message)
    publisher.send (message)
    i = 0 if ( i >= 10) else i + 1
    time.sleep(0.2)
