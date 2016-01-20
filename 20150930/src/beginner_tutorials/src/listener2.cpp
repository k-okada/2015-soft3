#include "ros/ros.h"
#include "std_msgs/String.h"
#include "beginner_tutorials/Hello.h"

<<<<<<< HEAD
void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s %f %f %f]", msg->data.c_str(), );
=======
void chatterCallback(const beginner_tutorials::Hello::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s %f %f %f]", msg->hello.c_str(), 
	   msg->pos.x, msg->pos.y, msg->pos.z);
>>>>>>> f5cb1c287b2c6b3c296cb4a319bcf6c4e661da94
}

int main(int argc, char **argv)
{
<<<<<<< HEAD
  ros::init(argc, argv, "listener");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);
=======
  ros::init(argc, argv, "listener2");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("chatter2", 1000, chatterCallback);
>>>>>>> f5cb1c287b2c6b3c296cb4a319bcf6c4e661da94
  ros::spin();
  return 0;
}
