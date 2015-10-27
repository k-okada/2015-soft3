1)
1-1)makeとcatkin_makeの違い
	-makeはMakeFileのあるディレクトリで行う。
	 catkin_makeはワークスペースの最上位のディレクトリで実行
	-makeによって生成された実行ファイルは元となったファイルと同じディレクトリ内で作られる
	 catkin_makeではdevelに格納される

1-2)pythonはコンパイルの必要がないインタプリタ言語だがなぜmakeをするのか
	CMakeをビルドシステムとして採用しているので、メッセージとサービスのために自動生成されるpythonコードを確実に作るため。

1-3)ros::Spin()とros::SpinOnce()の違い
	 ros::Spinはノードがシャットダウンされるまでコールバックされるが、ros::SpinOnceはその時に待機している全てのコールバックを呼ぶ。

1-4)actionファイルをコンパイルするとどのようなファイルができるか。
/home/mech-user/.local/share/Trash/files/DoDishesAction.2.msg
/home/mech-user/.local/share/Trash/files/DoDishesAction.msg
/home/mech-user/.local/share/Trash/info/DoDishesAction.2.msg.trashinfo
/home/mech-user/.local/share/Trash/info/DoDishesAction.msg.trashinfo
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir/DependInfo.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir/build.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir/cmake_clean.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir/depend.internal
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir/depend.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir/progress.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir/DependInfo.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir/build.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir/cmake_clean.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir/depend.internal
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir/depend.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir/progress.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir/DependInfo.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir/build.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir/cmake_clean.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir/depend.internal
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir/depend.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir/progress.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir/DependInfo.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir/build.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir/cmake_clean.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir/depend.internal
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir/depend.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir/progress.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir/DependInfo.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir/build.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir/cmake_clean.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir/depend.internal
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir/depend.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir/progress.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir/DependInfo.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir/build.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir/cmake_clean.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir/depend.internal
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir/depend.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir/progress.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir/DependInfo.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir/build.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir/cmake_clean.cmake
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir/depend.internal
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir/depend.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir/progress.make
/home/mech-user/work/win15/2015-soft3/20151007/build/beginner_tutorials/catkin_generated/stamps/beginner_tutorials/DoDishes.action.stamp
/home/mech-user/work/win15/2015-soft3/20151007/devel/include/beginner_tutorials/DoDishesAction.h
/home/mech-user/work/win15/2015-soft3/20151007/devel/include/beginner_tutorials/DoDishesActionFeedback.h
/home/mech-user/work/win15/2015-soft3/20151007/devel/include/beginner_tutorials/DoDishesActionGoal.h
/home/mech-user/work/win15/2015-soft3/20151007/devel/include/beginner_tutorials/DoDishesActionResult.h
/home/mech-user/work/win15/2015-soft3/20151007/devel/include/beginner_tutorials/DoDishesFeedback.h
/home/mech-user/work/win15/2015-soft3/20151007/devel/include/beginner_tutorials/DoDishesGoal.h
/home/mech-user/work/win15/2015-soft3/20151007/devel/include/beginner_tutorials/DoDishesResult.h
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesAction.py
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesAction.pyc
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionFeedback.py
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionFeedback.pyc
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionGoal.py
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionGoal.pyc
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionResult.py
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionResult.pyc
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesFeedback.py
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesFeedback.pyc
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesGoal.py
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesGoal.pyc
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesResult.py
/home/mech-user/work/win15/2015-soft3/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesResult.pyc
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/beginner_tutorials/msg/DoDishesAction.msg
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/beginner_tutorials/msg/DoDishesActionFeedback.msg
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/beginner_tutorials/msg/DoDishesActionGoal.msg
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/beginner_tutorials/msg/DoDishesActionResult.msg
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/beginner_tutorials/msg/DoDishesFeedback.msg
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/beginner_tutorials/msg/DoDishesGoal.msg
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/beginner_tutorials/msg/DoDishesResult.msg
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesAction.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionFeedback.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionGoal.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionResult.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesFeedback.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesGoal.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesResult.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesAction.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionFeedback.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionGoal.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionResult.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesFeedback.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesGoal.lisp
/home/mech-user/work/win15/2015-soft3/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesResult.lisp
/home/mech-user/work/win15/2015-soft3/20151007/src/beginner_tutorials/action/DoDishes.action
/home/mech-user/work/win15/2015-soft3/20151007/src/beginner_tutorials/action/DoDishes.action~

2)turtlebot_simulatorを実行してロボットを操作
ロボットからの視点ではないのでどこを向いているかわからず難しかった。スピード調節も難しかった。

3)
<topic>
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

/mobile_base/commands/velocityを/keyopから/gazeboに渡している

contacting node http://test1-pc:42063/ ...
Pid: 15837
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
    * to: /gazebo (http://test1-pc:48007/)
    * direction: inbound
    * transport: TCPROS


4)
何をすればいいのか、何を行っているのか全くわかりませんでした。もう少し期日まで粘ってみます。

5)
amcl_demo.launchまでできた。

6)
自分で作ったmapの通りに動いてくれるようである。
