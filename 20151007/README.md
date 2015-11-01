1-1)
catkin_makeはワークスペース最上位のディレクトリで実行するだけで開発環境に適したビルドのためのパッケージ設定、パッケージのビルド、インストールを一気に行ってくれる。最後の2つはmakeで行えるが、順番にひとつずつ、適切なディレクトリに移動して実行しなければならない。
http://wiki.ros.org/ja/catkin/Tutorials/using_a_workspaceを参照した

1-2)
メッセージやサービスのためのpythonコードを生成しなければならないため
http://wiki.ros.org/ja/ROS/Tutorials/WritingPublisherSubscriber(python)を参照した

1-3)
ros::spin()はコールバックを終了までずっと待つが、ros::spinOnce()はそれが呼ばれた一瞬だけしか待たない。Onceならある一定時間だけコールバックを待つ、ということができそう。
http://wiki.ros.org/roscpp/Overview/Callbacks%20and%20Spinningを参照した


1-4)
以下のようなファイルが生成されていた。
mech-user@test1-pc:~/2015-soft3/20151007$ find ./ -name *DoDishes*
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesAction.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionFeedback.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesResult.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesFeedback.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionGoal.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesResult.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionGoal.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionResult.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionFeedback.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesAction.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesFeedback.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesGoal.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesGoal.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionResult.lisp
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
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionResult.py
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionFeedback.py
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionResult.pyc
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesAction.py
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionGoal.py
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesFeedback.pyc
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesGoal.py
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesResult.pyc
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesGoal.pyc
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionFeedback.pyc
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesResult.py
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesFeedback.py
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionGoal.pyc
./devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesAction.pyc
./build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir
./build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir
./build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir
./build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir
./build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir
./build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir
./build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir
./build/beginner_tutorials/catkin_generated/stamps/beginner_tutorials/DoDishes.action.stamp
./src/beginner_tutorials/action/DoDishes.action
./src/beginner_tutorials/action/DoDishes.action~

要するにmsgファイルとlisp、python、Cのincludeファイルができている。

2)
した

3)
必要なトピック、メッセージは以下の通り

mech-user@test1-pc:~/2015-soft3/20151007$ rosnode info /keyop
--------------------------------------------------------------------------------
Node [/keyop]
Publications: 
 * /mobile_base/commands/velocity [geometry_msgs/Twist]
 * /rosout [rosgraph_msgs/Log]
 * /mobile_base/commands/motor_power [kobuki_msgs/MotorPower]

Subscriptions: 
 * /keyop/teleop [unknown type]
 * /clock [rosgraph_msgs/Clock]

Services: 
 * /keyop/get_loggers
 * /keyop/set_logger_level


contacting node http://test1-pc:52768/ ...
Pid: 9419
Connections:
 * topic: /rosout
    * to: /rosout
    * direction: outbound
    * transport: TCPROS
 * topic: /mobile_base/commands/velocity
    * to: /gazebo
    * direction: outbound
    * transport: TCPROS
 * topic: /mobile_base/commands/motor_power
    * to: /gazebo
    * direction: outbound
    * transport: TCPROS
 * topic: /clock
    * to: /gazebo (http://test1-pc:44906/)
    * direction: inbound
    * transport: TCPROS

実際に速度データを送受信してそうなのは/mobile_base/commands/velocityな模様

4)
コマンドライン引数からvx,vy,omegaを指定するものを書いた。

------------------------------

#!/usr/bin/env python                                                          

import roslib
import rospy
import sys
from geometry_msgs.msg import Twist

def set_vel(x,y,t):
    pub = rospy.Publisher('mobile_base/commands/velocity', Twist)
    rospy.init_node('MYkeyop')
    set_vel = Twist()
    set_vel.linear.x = x
    set_vel.linear.y = y
    set_vel.angular.z = t
    while(1):
        pub.publish(set_vel)
        rospy.sleep(0.1)
if __name__ == '__main__':
    params = map(lambda x: float(x), sys.argv[1:])
    set_vel(params[0],params[1],params[2])

-----------------------------


5)した。ただしソフトウェアを更新する前はバグが出てできなかった。
6)/move_base/feedbackというようなtopicができているので、このactionlibが起動しているのだと思われる。詳しく調べるというのはよくわからなかった。