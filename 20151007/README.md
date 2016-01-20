1)
1-1)
makeはMakefileをもとにコンパイルやリンクを行うが、catkin_makeではCMakeLists.txtをもとにMakefileを作成し、その後makeをする。つまり、cmakeとmakeを行う。

1-2)
pythonコードや、pythonコード内で扱う独自のサービスファイルやアクションファイルがパッケージの一部であることを認識させるために、一度buildを行う必要がある。

1-3)
ros::Spin()では、rosが起動している間ずっと、イベントの発生に対してコールバック関数を呼ぶのに対し、ros::SpinOnce()では一度コールバック関数が呼ばれると待機を終了する。

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

2)

3)
kobuki_keyop内のkeyop.launch、geometry_msgs内のTwist.msgを参照すると、
topic:
mobile_base/commands/velocity
message:geometry_msgs/Twist
Twist.msgの構成は以下のとおりである。
Vector3 linear
Vector3 angular

4)
keyop.cppを実装した。
起動すると、x方向に速度を出すようメッセージを送信する。

5)

6)
