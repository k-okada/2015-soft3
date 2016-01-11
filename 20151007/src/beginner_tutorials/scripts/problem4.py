#!/usr/bin/env python
import rospy
import sys

from std_msgs.msg import String
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import Twist
from kobuki_msgs.msg import MotorPower


def problem4(a, b):
	pubTwist = rospy.Publisher('mobile_base/commands/velocity', Twist, queue_size=10)
	pubMotorPower = rospy.Publisher('mobile_base/commands/motor_power', MotorPower, queue_size=10)
	rospy.init_node('problem4')
	
	pubMotorPower.publish(1)
	
	v_x = a * 1.
	omega_z = b * 1.
	
	while not rospy.is_shutdown():
		v =  Vector3(v_x, 0., 0.)
		omega = Vector3(0., 0., omega_z)
		twist = Twist(v, omega)
		pubTwist.publish(twist)
		print twist
		rospy.sleep(1.0)

if __name__ == '__main__':
	try:
		argv = sys.argv
		argc = len(argv)
		if (argc != 3):
			print "Usage: problem4 v_x omega_z"
			quit()
		v_x = float(argv[1])
		omega_z = float(argv[2])	
		problem4(v_x, omega_z)
	except rospy.ROSInterruptException:
		pass