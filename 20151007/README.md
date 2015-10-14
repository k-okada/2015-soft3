#problem 1
- 1
catkin-makeはmakeとcmakeを統合したようなものにrosのpackageをリンクするような機能をつけたもの
- 2
makeをしているわけではなくて、そのpythonファイルをパッケージに入れてあげる、みたいな操作ではないでしょうか
- 3
どちらもcallbackを呼ぶ関数であるが、spinはCtrl-cが押されない限りメッセージを受け取るたびcallbackを呼ぶ。spinOnceは一度だけ。
- 4
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

#problem 2
動かしました！

#problem 3
基本的に動いているプログラムは
/keyop/motor_power
/keyop/cmd_vel

配信しているtopicとしては
/mobile_base/commands/motor_power
/mobile_base/commands/velocity
購読しているtopicとしては
/clock
/keyop/teleop
が挙げられる

これらのmessage名を列挙すると上から順に
kobuki_msgs/MotorPower
geometry_msgs/Twist
rosgraph_msgs/Clock
kobuki_msgs/KeyboardInput
となる

#problem 4
srcの中にtest.cppという名前で入っていますが、一応ここにも貼ります

    #include"ros/ros.h"
    #include"geometry_msgs/Twist.h"

    int main(int argc, char** argv)
    {
        if(argc != 4){
            ROS_INFO("dame!");
            return 1;
        }
        ros::init(argc, argv, "keyop");
        ros::NodeHandle n;
        ros::Publisher pub = n.advertise<geometry_msgs::Twist>("mobile_base/commands/velocity", 1000);

        geometry_msgs::Twist twist;
        twist.linear.x = atof(argv[1]);
        twist.linear.y = atof(argv[2]);
        twist.linear.z = atof(argv[3]);
        twist.angular.x = 0.0;
        twist.angular.y = 0.0;
        twist.angular.z = 0.0;
        pub.publish(twist);
        ros::spinOnce();

        return 0;
    }

#problem 5
できました

#problem 6
actionlibのサーバーがたったってどうやったらわかるんだ…
あとで更新します…
