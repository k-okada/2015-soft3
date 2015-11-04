#!/usr/bin/env python
import rospy
import sys
from geometry_msgs.msg import Twist

def my_key_op():
    pub = rospy.Publisher('/mobile_base/commands/velocity', Twist)
    rospy.init_node('my_key_op')
    command = Twist()
    command.linear.x = 0.0
    command.linear.y = 0.0
    command.linear.z = 0.0
    command.angular.x = 0.0
    command.angular.y = 0.0
    command.angular.z = 0.0
    while not rospy.is_shutdown():
        key = raw_input()
        if key=='w':
            command.linear.x += 0.05
        elif key== 's':
            command.linear.x -= 0.05
        elif key== 'a':
            command.angular.z += 0.5
        elif key== 'd':
            command.angular.z -= 0.5
        elif key== 'q':
            break
        rospy.loginfo(command)
        pub.publish(command)
        
if __name__ == '__main__':
    try:
        my_key_op()
    except rospy.ROSInterruptExeception:
        pass
