#!/usr/bin/env python                                                           
import roslib
import rospy
from geometry_msgs.msg import Twist

def my_keyop():
    vel = Twist()
    pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, 10)
    while not rospy.is_shutdown():
        if raw_input('>>>') == 'q':
            vel.linear.x += 1.0
        if raw_input('>>>') == 'w':
            vel.linear.x -= 1.0
        if raw_input('>>>') == 'e':
            vel.angular.z += 1.0
        if raw_input('>>>') == 'r':
            vel.angular.z -= 1.0
        pub.publish(vel)

if __name__ == '__main__':
    try:
        my_keyop()
    except rospy.ROSInterruptException: pass




