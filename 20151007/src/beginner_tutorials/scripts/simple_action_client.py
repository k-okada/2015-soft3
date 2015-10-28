#! /usr/bin/env python

import roslib;roslib.load_manifest('beginner_tutorials')
import rospy
import actionlib

from beginner_tutorials.msg import *


if __name__=='__main__':
     rospy.init_node('do_dishes_client')
     client=actionlib.SimpleActionServer('do_dishes',DoDishesAction)
     client.wait_for_server()
     
     goal=DoDishes()
     goal.dishwasher_id=1
     print "Returning dishes_cleaned %d"%(result.total_dishes_cleaned)
     
     client.send_goal(goal)
     client.wait_for_result(rospy.Duration.from_sec(0.5))

     result = client.get_result()
     print "Resulting dishwasher %d"%(result.total_dishes_cleaned)
     
