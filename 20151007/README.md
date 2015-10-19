1.1 makeはmakefileを用いてソースコードをコンパイルするが、catkin_makeはmakefileを生成し、コンパイルを行うのでcmake+makeのような機能を持っている。  
1.2 pythonのソースコード自体はコンパイルする必要はないが、ROSにスクリプトの存在を伝えパッケージの一部として認識するためにmakeを行う必要がある。  
1.3 ros::spin()もros::spinOnce()もコールバックを呼ぶ関数であるが、ros::spin()はノードがシャットダウンするまで繰り返しコールバックを呼びつづけるのに対し、ros::spinOnce()はその時点で呼ばれるのを待っているコールバックを呼んだ後は終了するようになっている。
1.4 DoDishes.actionによって生成されるファイル
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


2 turtlebotをkeyop.launchで操作した。矢印キーを離しても速度が保存されるので思ったように操作することが難しかった。  
3 keyop.launchの中ではindigo/lib/kobuki_keyop/keyopを立ち上げている。keyop.launchによるとmobile_base/commands/velocityというtopicを用いている。keyop_core.hppを見るとTwistというmessageを用いている。  

4 "src/mykey_op.cpp"にソースコードを置いています
	#include "ros/ros.h"
	#include "geometry_msgs/Twist.h"
	#include <iostream>

	int main(int argc, char** argv)
	{
		ros::init(argc, argv, "mykey_op");
		ros::NodeHandle n;
		ros::Publisher com_velocity = n.advertise<geometry_msgs::Twist>("mobile_base/commands/velocity", 100);
		ros::Rate loop_rate(1);
		geometry_msgs::Twist twist;
		std::cout << "Input linear param" << std::endl;
		std::cin >> twist.linear.x;
		std::cin >> twist.linear.y;
		std::cin >> twist.linear.z;
		std::cout << "Input angular param" << std::endl;
		std::cin >> twist.angular.x;
		std::cin >> twist.angular.y;
		std::cin >> twist.angular.z;
		while (ros::ok()) {
			com_velocity.publish(twist);
			ros::spinOnce();
			loop_rate.sleep();
		}

		return 0;
	}

5 Make a map and navigate with itのamcl_demo.launchまで行った。  
6 5で立ち上がったactionlibサーバだが配信、購読されているtopicを見たところMoveBase.actionで定義されるactionlibサーバが立ち上がっていると思われる。actionlibはgoal、result、feedbackの3つについてのmessageを送受信する機能をもつ。MoveBase.actionを見るとGoalについてはactionlib_msgs/GoalID型のgoal_idとgeometry_msgs/PoseStamped型のtarget_posを送り、Resultについてはactionlib_msgs/GoalStatus型のstatusを送り、Feedbackについてはactionlib_msgs/GoalStatus型のstatusとgeometry_msgs/PoseStamped型のbase_posを送っている。  
