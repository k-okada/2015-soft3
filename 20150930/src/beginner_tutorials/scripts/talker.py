#!/usr/bin/env python
import roslib
import rospy
from std_msgs.msg import String
def talker():
<<<<<<< HEAD
	pub = rospy.Publisher('chatter',String)
	rospy.init_node('talker')
	while not rospy.is_shutdown():
		str = "hello world %s"%rospy.get_time()
		rospy.loginfo(str)
		pub.publish(String(str))
		rospy.sleep(1.0)
if __name__ == '__main__':
	try:
		talker()
	except rospy.ROSInterruptException: pass
=======
    pub = rospy.Publisher('chatter',String)
    rospy.init_node('talker')
    while not rospy.is_shutdown():
        str = "hello world %s"%rospy.get_time()
        rospy.loginfo(str)
        pub.publish(String(str))
        rospy.sleep(1.0)
if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException: pass
>>>>>>> f5cb1c287b2c6b3c296cb4a319bcf6c4e661da94
