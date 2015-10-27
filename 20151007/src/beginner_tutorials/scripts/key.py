#!/usr/bin/env python
import rospy
import sys
from select import select
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from kobuki_msgs.msg import MotorPower

def key():
    pub_vel=rospy.Publisher('/mobile_base/commands/velocity',Twist,queue_size=10)
    pub_motor=rospy.Publisher('/mobile_base/commands/motor_power',MotorPower,queue_size=10)
    rospy.init_node('key')
    msg_vel=Twist()
    msg_motor=MotorPower()
    msg_motor.state=1
    print msg_vel
    print msg_motor
    while not rospy.is_shutdown():
        rlist, _, _ = select([sys.stdin], [], [], 0.1)
        if rlist:
            key_pressed=str(sys.stdin.readline())
            print key_pressed
            if key_pressed=="w\n":
                msg_vel.linear.x+=0.05
            if key_pressed=="s\n":
                msg_vel.linear.x-=0.05
            if key_pressed=="a\n":
                msg_vel.angular.z+=0.33
            if key_pressed=="d\n":
                msg_vel.angular.z-=0.33
            if key_pressed=="o\n":
                msg_motor.state=1
            if key_pressed=="p\n":
                msg_motor.state=0
            print msg_vel
        pub_vel.publish(msg_vel)
        pub_motor.publish(msg_motor)
        rospy.sleep(0.1)

if __name__=='__main__':
    try:
        key()
    except rospy.ROSInterruptException:
        pass
