#!/usr/bin/env python

import roslib
import rospy
import sys
from geometry_msgs.msg import Twist

def set_vel(x,y,t):
    pub = rospy.Publisher('mobile_base/commands/velocity', Twist)
    rospy.init_node('MYkeyop')
    set_vel = Twist()
    set_vel.linear.x = x
    set_vel.linear.y = y
    set_vel.angular.z = t
    while(1):
        pub.publish(set_vel)
        rospy.sleep(0.1)
if __name__ == '__main__':
    params = map(lambda x: float(x), sys.argv[1:])
    set_vel(params[0],params[1],params[2])
