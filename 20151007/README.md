##20151007宿題

1-1)catkin_makeは普通のmakeによるビルドだけでなく、自動的に簡易的に多くのツールや、様々な言語が用いられた依存するプログラムを関連させてビルドすることができる。
1-2)パッケージ内の依存するファイルと関連付けるため。

1-3)ros::spinOnce()はコールバック関数を1度呼び出す関数で、ros:spin()はノードが終了されるまでその呼び出しを繰り返し続ける。
1-4)

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
./built/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir
./built/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir
./built/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir
./built/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir
./built/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir
./built/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir
./built/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir
./built/beginner_tutorials/catkin_generated/stamps/beginner_tutorials/DoDishes.action.stamp




2)実行した

3)
Node [/keyop]
Publications: 
 * /rosout [rosgraph_msgs/Log]
 * /mobile_base/commands/velocity [geometry_msgs/Twist]
 * /mobile_base/commands/motor_power [kobuki_msgs/MotorPower]

Subscriptions: 
 * /keyop/teleop [unknown type]
 * /clock [rosgraph_msgs/Clock]

Services: 
 * /keyop/get_loggers
 * /keyop/set_logger_level


contacting node http://test1-pc:43203/ ...
Pid: 6174
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
    * to: /gazebo (http://test1-pc:57419/)
    * direction: inbound
    * transport: TCPROS

