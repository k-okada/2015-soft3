#### 1-1)
catkin_makeでは、単純なmakeの機能に加えてコード、パッケージ間の依存関係を管理できるようにしたものである。

#### 1-2)
pythonファイルをパッケージの一部として認識させている。

#### 1-3)
ros::Spinはctrl-c等で明示的に終了命令がなされるまでコールバックを呼び出し続けるのに対し、ros::SpinOnceは一度のみ呼び出す。

#### 1-4)
mech-user@test1-pc:~/work/2015-soft3/20151007/devel$ find . dodishes
./share/common-lisp/ros/beginner_tutorials/msg/DoDishesAction.lisp
./share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionFeedback.lisp
./share/common-lisp/ros/beginner_tutorials/msg/DoDishesResult.lisp
./share/common-lisp/ros/beginner_tutorials/msg/DoDishesFeedback.lisp
./share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionGoal.lisp
./share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesResult.lisp
./share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionGoal.lisp
./share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionResult.lisp
./share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionFeedback.lisp
./share/common-lisp/ros/beginner_tutorials/msg/beginner_tutorials-msg.asd
./share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesAction.lisp
./share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesFeedback.lisp
./share/common-lisp/ros/beginner_tutorials/msg/_package.lisp
./share/common-lisp/ros/beginner_tutorials/msg/DoDishesGoal.lisp
./share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesGoal.lisp
./share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionResult.lisp
./share/common-lisp/ros/beginner_tutorials/srv/AddTwoInts.lisp
./share/common-lisp/ros/beginner_tutorials/srv/beginner_tutorials-srv.asd
./share/common-lisp/ros/beginner_tutorials/srv/_package_AddTwoInts.lisp
./share/common-lisp/ros/beginner_tutorials/srv/_package.lisp
./share/beginner_tutorials/msg/DoDishesGoal.msg
./share/beginner_tutorials/msg/DoDishesFeedback.msg
./share/beginner_tutorials/msg/DoDishesActionResult.msg
./share/beginner_tutorials/msg/DoDishesAction.msg
./share/beginner_tutorials/msg/DoDishesActionGoal.msg
./share/beginner_tutorials/msg/DoDishesResult.msg
./share/beginner_tutorials/msg/DoDishesActionFeedback.msg
./share/beginner_tutorials/cmake/beginner_tutorials-msg-paths.cmake
./share/beginner_tutorials/cmake/beginner_tutorialsConfig.cmake
./share/beginner_tutorials/cmake/beginner_tutorials-msg-extras.cmake
./share/beginner_tutorials/cmake/beginner_tutorialsConfig-version.cmake
./include/beginner_tutorials/DoDishesActionResult.h
./include/beginner_tutorials/AddTwoIntsRequest.h
./include/beginner_tutorials/AddTwoInts.h
./include/beginner_tutorials/DoDishesAction.h
./include/beginner_tutorials/DoDishesGoal.h
./include/beginner_tutorials/DoDishesActionFeedback.h
./include/beginner_tutorials/DoDishesActionGoal.h
./include/beginner_tutorials/DoDishesFeedback.h
./include/beginner_tutorials/AddTwoIntsResponse.h
./include/beginner_tutorials/DoDishesResult.h
./lib/pkgconfig/beginner_tutorials.pc
./lib/python2.7/dist-packages/beginner_tutorials/__init__.pyc
./lib/python2.7/dist-packages/beginner_tutorials/msg/__init__.pyc
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionResult.py
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionFeedback.py
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionResult.pyc
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesAction.py
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionGoal.py
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesFeedback.pyc
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesGoal.py
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesResult.pyc
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesGoal.pyc
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionFeedback.pyc
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesResult.py
./lib/python2.7/dist-packages/beginner_tutorials/msg/__init__.py
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesFeedback.py
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionGoal.pyc
./lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesAction.pyc
./lib/python2.7/dist-packages/beginner_tutorials/srv/__init__.pyc
./lib/python2.7/dist-packages/beginner_tutorials/srv/__init__.py
./lib/python2.7/dist-packages/beginner_tutorials/srv/_AddTwoInts.py
./lib/python2.7/dist-packages/beginner_tutorials/srv/_AddTwoInts.pyc
./lib/python2.7/dist-packages/beginner_tutorials/__init__.py
./_setup_util.py

#### 2)
turtlebot_simulatorを実行し、keyop.launchでロボットを操作しました。

#### 3)
mech-user@test1-pc:~/work/2015-soft3/20151007$ rosnode list
/keyop
/rosout
mech-user@test1-pc:~/work/2015-soft3/20151007$ rostopic list
/clock
/keyop/teleop
/mobile_base/commands/motor_power
/mobile_base/commands/velocity
/rosout
/rosout_agg
mech-user@test1-pc:~/work/2015-soft3/20151007$ rosnode info /keyop 
--------------------------------------------------------------------------------
Node [/keyop]
Publications: 
 * /mobile_base/commands/velocity [geometry_msgs/Twist]
 * /rosout [rosgraph_msgs/Log]
 * /mobile_base/commands/motor_power [kobuki_msgs/MotorPower]

Subscriptions: 
 * /keyop/teleop [unknown type]
 * /clock [unknown type]

Services: 
 * /keyop/get_loggers
 * /keyop/set_logger_level


contacting node http://test1-pc:59035/ ...
Pid: 15952
Connections:
 * topic: /rosout
    * to: /rosout
    * direction: outbound
    * transport: TCPROS

#### 4), 5), 6)
工事中