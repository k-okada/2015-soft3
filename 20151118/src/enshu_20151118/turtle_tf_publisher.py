#!/usr/bin/env python

import roslib
import rospy, math, tf
import geometry_msgs.msg

if __name__ == '__main__':
    rospy.init_node('tf_turtle')
    listener = tf.TransformListener()
    turtle_vel = rospy.Publisher('turtle2/cmd_vel', geometry_msgs.msg.Twist)
    rate = rospy.Rate(10.0)
    while not rospy.is_shutdown():
        try:
            (trans,rot) = listener.lookupTransform('/turtle2', '/turtle1', rospy.Time(0))
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue
        angular = 4 * math.atan2(trans[1], trans[0])
        linear = 0.5 * math.sqrt(trans[0] ** 2 + trans[1] ** 2)
        rospy.loginfo("angular = %f, linear = %f"%(angular, linear))
        turtle_vel.publish(geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(linear,0,0), geometry_msgs.msg.Vector3(0,0,angular)))
        rate.sleep()
