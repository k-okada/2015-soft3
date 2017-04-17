#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include <stdio.h>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "mykeyop");

  ros::NodeHandle n;

  ros::Publisher pub = n.advertise<geometry_msgs::Twist>("mobile_base/commands/velocity",1000);

  ros::Rate loop_rate(10);

  double linear, angular;
  while(ros::ok()){
    geometry_msgs::Twist twist;
    int c;
    printf("enter the key\n");
    system("stty -echo -icanon min 1 time 0");
 
    while(1){
      c = getchar();
      if(c!=EOF)break;
    }
    system("stty echo -icanon min 1 time 0");

    switch (c){
    case 0x31://1
      twist.linear.x = linear+0.05;
      twist.angular.z = angular;
      break;
      
    case 0x32://2
      twist.linear.x = linear-0.05;
      twist.angular.z = angular;
      break;
      
    case 0x33://3
      twist.linear.x = linear;
      twist.angular.z = angular+0.33;
      break;
      
    case 0x34://4
      twist.linear.x = linear;
      twist.angular.z = angular-0.33;
      break;
      
    case 0x35://5
      twist.linear.x = 0.0;
      twist.angular.z = 0.0;
      break;

    case 0x71://q
      return 0;

    default:
      twist.linear.x = linear;
      twist.angular.z = angular;
      break;
    }
    linear = twist.linear.x;
    angular = twist.angular.z;
    printf("%lf,%lf",linear,angular);
    pub.publish(twist);
    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}
