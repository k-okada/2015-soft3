#! /usr/bin/env python

import roslib; roslib.load_manifest('beginner_tutorials')
import rospy
import actionlib
from beginner_tutorials.msg import *

class DoDishesServer:
    def __init__(self):
        self.server = actionlib.SimpleActionServer('do_dishes',DoDishesAction, self.execute,False)
        self.server.start()

    def execute(self, goal):
        print "Requeting dishwasher %d"%(goal.dishwasher_id)
        result = self.server.get_default_result()
        print "Returning dishes_cleaned %d"%(result.total_dishes_cleaned)
        self.server.set_succeeded(result)

if __name__ == '__main__':
    rospy.init_node('do_dishes_server')
    server = DoDishesServer()
    rospy.spin()
