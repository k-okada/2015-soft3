#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist

rospy.init_node('my_keyop')
pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size = 10)
r = rospy.Rate(10)
while not rospy.is_shutdown():
    vel = Twist()
    x = raw_input('q,w,e,r,p:')
    if 'q' in x:
        vel.linear.x = 1.0
    if 'w' in x:
        vel.linear.x = -1.0
    if 'e' in x:
        vel.angular.z = 1.0
    if 'r' in x:
        vel.angular.z = -1.0
    if 'p' in x:
        break
    pub.publish(vel)
    r.sleep()
