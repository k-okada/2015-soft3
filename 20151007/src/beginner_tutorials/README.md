1-1)make...既存のmakefileをもとにビルド・コンパイルを行う。
　　catkin_make...makefileを新たに作成し、その後ビルド・コンパイルを行う。(cmake + make)
1-2)pythonのコード自体をコンパイルしているのではなく、ROSパッケージを生成している。
1-3)ros::spin()...Ctr+cが押されるまでコールバック関数を呼び続ける。
    ros::spinOnce()...その時点で待機しているコールバック関数を呼んだら終了する。
1-4)
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesAction.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesResult.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesFeedback.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionGoal.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionResult.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionFeedback.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesGoal.lisp
./devel/share/beginner_tutorials/msg/DoDishesGoal.msg
./devel/share/beginner_tutorials/msg/DoDishesFeedback.msg
./devel/share/beginner_tutorials/msg/DoDishesActionResult.msg
./devel/share/beginner_tutorials/msg/DoDishesAction.msg
./devel/share/beginner_tutorials/msg/DoDishesActionGoal.msg
./devel/share/beginner_tutorials/msg/DoDishesResult.msg
./devel/share/beginner_tutorials/msg/DoDishesActionFeedback.msg
./devel/include/beginner_tutorials/DoDishesActionResult.h
./devel/include/beginner_tutorials/DoDishesAction.h
./devel/include/beginner_tutorials/DoDishesGoal.h
./devel/include/beginner_tutorials/DoDishesActionFeedback.h
./devel/include/beginner_tutorials/DoDishesActionGoal.h
./devel/include/beginner_tutorials/DoDishesFeedback.h
./devel/include/beginner_tutorials/DoDishesResult.h
./build/beginner_tutorials/catkin_generated/stamps/beginner_tutorials/DoDishes.action.stamp

2)操作しました。
3)topic名:mobile_base/commands/velocity
  messageの型:geometry_msgs/Twist
4)以下のようなプログラムを作りました。(vel_publisher.py)
"""
#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist

rospy.init_node('vel_publisher')
pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size = 10)

while not rospy.is_shutdown():
    vel = Twist()
    direction = raw_input('f, b, l, r, q: ')
    if 'f' in direction:
        vel.linear.x = 0.5
    if 'b' in direction:
        vel.linear.x = -0.5
    if 'l' in direction:
        vel.angular.z = 1.0
    if 'r' in direction:
        vel.angular.z = -1.0
    if 'q' in direction:
        break
    print vel
    pub.publish(vel)
"""

