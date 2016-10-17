#include "ros/ros.h"
#include "geometry_msgs/Twist.h"

#include <sstream>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "keyop_v1");
  ros::NodeHandle n;
  ros::Publisher vel_pub = n.advertise<geometry_msgs::Twist>("mobile_base/commands/velocity", 1);
  geometry_msgs::Twist cmd;
  cmd.linear.x = 0.0;
  cmd.linear.y = 0.0;
  cmd.linear.z = 0.0;
  cmd.angular.x = 0.0;
  cmd.angular.y = 0.0;
  cmd.angular.z = 0.0;

  std::cout << "Reading from keyboard" << std::endl;
  std::cout << "---------------------" << std::endl;
  std::cout << "w/s : linear  velocity +/-." << std::endl;
  std::cout << "a/d : angular velocity +/-." << std::endl;
  std::cout << " c  : send current linear/angular velocities." << std::endl;
  std::cout << " r  : reset linear/angular velocities." << std::endl;
  std::cout << " q  : quit." << std::endl;
  std::cout << "ENTER after commands." << std::endl;

  while(ros::ok())
    {
      char c = 'i';

      vel_pub.publish(cmd);
      std::cin >> c;
      switch (c)
	{
	case 'w':
	  cmd.linear.x += 0.1;
	  break;
	case 's':
	  cmd.linear.x -= 0.1;
	  break;
	case 'a':
	  cmd.angular.z += 0.314;
	  break;
	case 'd':
	  cmd.angular.z -= 0.314;
	  break;
	case 'c':
	  break;
	case 'r':
	  cmd.linear.x = 0;
	  cmd.angular.z = 0;
	  break;
	case 'q':
	  ros::shutdown();
	  break;
	}
    }

  return 0;
}
