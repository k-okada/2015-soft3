#!/usr/bin/env python

import roslib
import rospy

from geometry_msgs.msg import Twist

def keyop():
    pub = rospy.Publisher('mobile_base/commands/velocity', Twist)
    rospy.init_node('keyop')
    while not rospy.is_shutdown():
        str = "hello world %s"%rospy.get_time()
        twist = Twist()
        twist.linear.x = 1.0;
        twist.linear.y = 1.0;
        twist.linear.z = 1.0;
        twist.angular.x = 1.0;
        twist.angular.y = 1.0;
        twist.angular.z = 1.0;
        pub.publish(twist)
        rospy.sleep(1.0)

if __name__ == '__main__':
    try:
        keyop()
    except rospy.ROSInterruputExection: pass
