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
