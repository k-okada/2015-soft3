(1-1) catkin_makeはcmake + makeを行っていて、C++やPythonで記述されたファイルをパッケージに関連付けている。
(1-2) パッケージに関連づけるため。
(1-3) ros::Spin()はコールバック関数をスレッドが残っている間は呼びつづける。ros::SpinOnceは呼び出したときに一度だけコールバック関数を呼ぶ。
(1-4)./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesAction.lisp
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
というファイルが生成された。

(2) 操作した。
(3) topic名:/mobile_base/commands/velocity
    message名:geometry_msgs/Twist
(4)

mport roslib
import rospy

from geometry_msgs.msg import Twist

def keyop():
    pub = rospy.Publisher('mobile_base/commands/velocity', Twist)
    rospy.init_node('keyop')
    while not rospy.is_shutdown():
        str = "hello world %s"%rospy.get_time()
        twist = Twist()
        twist.linear.x = 1.0;
        twist.linear.y = 1.0;
        twist.linear.z = 1.0;
        twist.angular.x = 1.0;
        twist.angular.y = 1.0;
        twist.angular.z = 1.0;
        pub.publish(twist)
        rospy.sleep(1.0)

if __name__ == '__main__':
    try:
        keyop()
    except rospy.ROSInterruputExection: pass

キーボードの入力から速度を計算するところまでは実装できませんでした。rostopic echo /mobile_base/commands/velocityで正しく出力されていることを確認しました。

(5) 何をすればいいのかよくわからなかったのですが、roslaunch turtlebot_gazebo amcl_demo.launch を実行しました。
(6) 生成したmapをロボットが走る。

