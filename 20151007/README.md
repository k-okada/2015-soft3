問題1-1
makeとcmakeを合わせたコマンドで、ソースファイル・スクリプトファイルをパッケージに関連づける。

問題1-2
スクリプトをパッケージに関連付けるため。

問題1-3
ros::spin()はコールバック関数を呼び続ける。（無限ループ）
ros::spinOnce()は1度だけその場でコールバック関数を呼ぶ。

問題1-4
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
./src/beginner_tutorials/action/DoDishes.action
というファイルが生成された。

問題2
操作した。速度、角速度を指定している。

問題3
/mobile_base/commands/velocity がtopic
メッセージはTwistという型

問題4
import roslib
import rospy
import sys
from std_msgs.msg import String
from geometry_msgs.msg import Twist

def keyop():
    pub = rospy.Publisher('mobile_base/commands/velocity', Twist)
    rospy.init_node('keyop')
    twist = Twist();
    twist.linear.x = 0.0;
    twist.linear.y = 0.0;
    twist.linear.z = 0.0;
    twist.angular.x = 0.0;
    twist.angular.y = 0.0;
    twist.angular.z = 0.0;
    while not rospy.is_shutdown():
        rospy.roginfo(twist)
	pub.publish(twist)
	rospy.sleep(1.0);

if __name__ == '__main__':
    try:
        keyop()
    except rospy.ROSInterruptException: pass

問題5
できた。

問題6
map情報を提供している？　よくわかりませんでした。

