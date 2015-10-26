1-1)catkin_makeはcmakeとmakeを組み合わせたようなもの。makeはmakefileをビルドするが、catkin_makeはmakefileの自動生成からビルドまでを行ってくれる。

1-2)cmakeをビルドシステムとして採用しているので、pythonのノードであってもcmakeを使わなくてはならないため。makeによってmsgファイルやsrvファイルからpythonコードを自動生成する。

1-3)ros::spin()は、終了するまでコールバックを呼ぶが、ros::spinOnce()は一度だけコールバックを呼ぶ。

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

2)操作しました

3)
topic名 [message名]
/mobile_base/commands/velocity [geometry_msgs/Twist]
/mobile_base/commands/motor_power [kobuki_msgs/MotorPower]
の２つをpublishしている。

4)
"src/mykeyop.cpp"にあります。

5,6)
mapが生成されずできていません。
[ WARN] [1445824700.596883548, 77.010000000]: MessageFilter [target=odom ]: Dropped 100.00% of messages so far. Please turn the [ros.gmapping.message_notifier] rosconsole logger to DEBUG for more information.
というエラーがroslaunch turtlebot_gazebo gmapping_demo.launchで出てきてしまいます。


