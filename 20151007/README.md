1-1)

1-2)
コンパイルの必要はなくとも、ソースコード中の関数などを読み込んで全て定義する必要があるから

1-3)
ros::spin()はコールバックを終了までずっと待つが、ros::spinOnce()はそれが呼ばれた一瞬だけしか待たない。Onceならある一定時間だけコールバックを待つ、ということができそう。

1-4)
いろいろ
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



2)
した

3)