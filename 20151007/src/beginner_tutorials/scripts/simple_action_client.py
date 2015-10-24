#! /usr/bin/env python

import roslib;roslib.load_manifest('beginner_tutorials')
import rospy
import actionlib

if __name__=='__main__':
     rospy.init_node('do_dishes_server')
     client=actionlib.SimpleActionServer('do_dishes',DoDishesAction)
     client.wait_for_server()
     
     goal=DoDishes()
     goal.dishwasher_id=1
     print "Returning dishes_cleaned %d"%(result.total_dishes_cleaned)
     
     client.send_goal(goal)
     client.wait_for_result(rospy.Duration.from_sec(0.5))

     
