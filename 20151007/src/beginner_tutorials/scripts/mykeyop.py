#!/usr/bin/env python
import rospy
from kobuki_msgs.msg import MotorPower
from geometry_msgs.msg import Twist

def talker():
    pow_pub = rospy.Publisher('mobile_base/commands/motor_power', MotorPower)
    vel_pub = rospy.Publisher('mobile_base/commands/velocity', Twist);
    rospy.init_node('mykeyop')
    while not rospy.is_shutdown():
        motor_power = MotorPower()
        motor_power.state = motor_power.ON
        velocity = Twist()
        velocity.linear.x = 0.5
        velocity.angular.z = 0.3

        rospy.loginfo(motor_power)
        rospy.loginfo(velocity)
        pow_pub.publish(motor_power)
        vel_pub.publish(velocity)


        rospy.sleep(0.01)

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
