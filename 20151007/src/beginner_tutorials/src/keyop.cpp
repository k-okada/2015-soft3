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
