#!/usr/bin/env python

import roslib
import rospy, math, tf
import turtlesim.msg
import turtlesim.srv

if __name__ == '__main__':
    rospy.init_node('tf_turtle')
    listener = tf.TransformListener()
    rate = rospy.Rate(10.0)
    while not rospy.is_shutdown():
        try:
            (trans,rot) = listener.lookupTransform('/turtle2', '/turtle1', rospy.Time(0))
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue
        angular = 4 * math.atan2(trans[1], trans[0])
        linear = 0.5 * math.sqrt(trans[0] ** 2 + trans[1] ** 2)
        rospy.loginfo("angular = %f, linear = %f"%(angular, linear))
        rate.sleep()
