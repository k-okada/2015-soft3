#!/usr/bin/env python
import rospy
from std_msgs.msg import String

#to set linear and angular 3d data import Twist msg protocol
from geometry_msgs.msg import Twist

def talker():
    pub = rospy.Publisher('chatter',String)
    ##pub = rospy.Publisher('mobile_base/commands/velocity',Twist)

    rospy.init_node('talker')
    while not rospy.is_shutdown():
        str = "hello world %s" % rospy.get_time()
        ##twist = Twist();
        ##twist.linear.x= 1.0
        ##twist.linear.y= 0.0
        ##twist.linear.z= 0.0
        ##twist.angular.x= 0.0
        ##twist.angular.y= 0.0       
        ##twist.angular.z= 0.0
        rospy.loginfo(str)
        ##rospy.loginfo(twist)
        pub.publish(String(str))
        ##pub.publish(twist)
        rospy.sleep(1.0)

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
