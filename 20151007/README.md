1) 以下の質問に答えよ

1-1) makeとcatkin_makeは何が違うのか.
	makeはmakefileを用いて依存関係の複雑なコンパイルを簡略化するものであるが, catkin_makeはROSのパッケージにおいてmakeとcmakeとを統合してコンパイルすることができるコマンドである.

1-2) pythonはコンパイルの必要ないインタプリンタ言語のはずだが何故makeをするのか.

	python自体はコンパイルは必要ないが, ROSのパッケージ内でpythonのスクリプトを使用可能にする手続きの一環としてmakeする必要がある.

1-3) ros::Spin()とros::SpinOnce()は何が違うのか.

	ros::Spin()はノードが閉じられるまでコールバック関数を繰り返し呼び出すが, ros::SpinOnce()はコールバック関数を一度しか呼び出さない.

1-4) actionファイルをコンパイルするとどのようなファイルができるか, DoDishes.actionを例に説明せよ.

以下のファイルが生成される.
/20151007/devel/share/beginner_tutorials/msg/DoDishesGoal.msg
/20151007/devel/share/beginner_tutorials/msg/DoDishesActionResult.msg
/20151007/devel/share/beginner_tutorials/msg/DoDishesAction.msg
/20151007/devel/share/beginner_tutorials/msg/DoDishesActionFeedback.msg
/20151007/devel/share/beginner_tutorials/msg/DoDishesFeedback.msg
/20151007/devel/share/beginner_tutorials/msg/DoDishesResult.msg
/20151007/devel/share/beginner_tutorials/msg/DoDishesActionGoal.msg
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesResult.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionResult.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionGoal.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesGoal.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionResult.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesFeedback.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesResult.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionFeedback.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesFeedback.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesGoal.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesAction.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesAction.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionFeedback.lisp
/20151007/devel/share/common-lisp/ros/beginner_tutorials/msg/_package_DoDishesActionGoal.lisp
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesFeedback.py
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionFeedback.pyc
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionResult.py
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionGoal.pyc
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionGoal.py
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesGoal.pyc
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesFeedback.pyc
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionFeedback.py
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesGoal.py
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesActionResult.pyc
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesResult.pyc
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesAction.pyc
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesAction.py
/20151007/devel/lib/python2.7/dist-packages/beginner_tutorials/msg/_DoDishesResult.py
/20151007/devel/include/beginner_tutorials/DoDishesActionResult.h
/20151007/devel/include/beginner_tutorials/DoDishesResult.h
/20151007/devel/include/beginner_tutorials/DoDishesGoal.h
/20151007/devel/include/beginner_tutorials/DoDishesActionGoal.h
/20151007/devel/include/beginner_tutorials/DoDishesAction.h
/20151007/devel/include/beginner_tutorials/DoDishesActionFeedback.h
/20151007/devel/include/beginner_tutorials/DoDishesFeedback.h
/20151007/src/beginner_tutorials/action/DoDishes.action~
/20151007/src/beginner_tutorials/action/DoDishes.action
/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesAction.dir
/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesGoal.dir
/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionGoal.dir
/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesFeedback.dir
/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionResult.dir
/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesResult.dir
/20151007/build/beginner_tutorials/CMakeFiles/_beginner_tutorials_generate_messages_check_deps_DoDishesActionFeedback.dir
/20151007/build/beginner_tutorials/catkin_generated/stamps/beginner_tutorials/DoDishes.action.stamp

2) turtlebot_simulatorを実行しkeyop.launchでロボットを操作せよ.

	turtlebot_keyop.pngを参照.

3) keyop.launchの中で立ち上がっているプログラムを調べて, そのプログラムとロボットを操作するのに必要なtopic名とmessage名を調べよ.

   	keyopのプログラムをみると, geometry_msgs/Twistのmessageをkeyop/cmd_velのtopicにロボットの速度として送っていることがわかる. 今度はkeyop.launchをみると, それがmobile_base/commands/velocityにリマップされているので, こちらにロボットの速度を送れば良い.

4) keyop.launchと同じことができるプログラム, すなわち(2)で見つけたトピック名に必要なmessageを出力するプログラムを作れ.

   	keyop_v1.cppを参照.

5) Make a map and navigate with itのamcl_demo.launchまで出来るようにせよ.

   	amcl_demo.pngを参照.

6) 5)を立ち上げるとactionlibサーバが立ち上がるはずである.どのような機能を提供するものか調べよ.

	actionlibのサーバとクライアントはGoal, Feedback, Resultを送受信するものであり, 5)で立ち上がったサーバはMovebase.actionにて定義されたもののようである. Movebase.actionでは, 以下をやりとりしている.
	Goal : actionlib_msgs/GoalID型のgoal_idとgeometry_msgs/PoseStamped型のtarget_pos
	Feedback : actionlib_msgs/GoalStatus型のstatusとgeometry_msgs/PoseStamped型のbase_pos
	Result : actionlib_msgs/GoalStatus型のstatus