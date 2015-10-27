# 2015-soft3

1)
1-1)
catkin_makeはmakefileを新しく作って、makeのようにビルドとコンパイルを行う

1-2)
ROSパッケージを作っている。pythonで書かれたコードをコンパイルしているわけではない

1-3)
ros::spin()はCtrl-Cが押されるまでコールバック関数を呼び続けるもの
ros::spinOnce()は1回コールバック関数を読んだら終わる

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
実行しました

3)
topic
mobile_base/commands/motor_power
mobile_base/commands/velocity

message
obuki_msgs/MotorPower
geometry_msgs/Twist

4)
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

5),6)
?