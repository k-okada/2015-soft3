1)
1-1)makeはソースからプログラムを自動的にコンパイルする。コンパイラや等の指定はMakefileで行う。catkin_makeはROSで依存関係にある多くのソースをクロスコンパイルを行う。
1-2)メッセージなどに対応したPythonのコードを正しく自動生成するため。
1-3)サブスクライバにおいて、ros::Spin()はCtrl-Cなどを押さない限り受信するたびにコールバック関数を呼び出す。ros::SpinOnce()は一度だけコールバック関数を呼び出す。
1-4)DoDishesActionFeedback.h  
DoDishesGoal.h   
DoDishesActionGoal.h      
DoDishesResult.h  
DoDishesActionResult.h
DoDishesAction.h      
DoDishesFeedback.h

DoDishesAction.msg          
DoDishesActionResult.msg  
DoDishesResult.msg
DoDishesActionFeedback.msg  
DoDishesFeedback.msg
DoDishesActionGoal.msg      
DoDishesGoal.msg

2)操作しました。
3) topic
/mobile_base/commands/velocity
/mobile_base/commands/motor_power
/keyop/teleop
message
geometry_msgs/Twist
kobuki_msgs/MotorPower
kobuki_msgs/KeyboardInput
4)一応作りましたが、keyboardinputがturtlebotの動きに反映されてません。

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "geometry_msgs/Twist.h"
#include "kobuki_msgs/MotorPower.h"
#include <sstream>

int main(int argc, char **argv)
{
  int power_status = false;
 
  ros::init(argc, argv, "keyop_test");
  ros::NodeHandle n;
  ros::Publisher pub = n.advertise<geometry_msgs::Twist>("mobile_base/commands/velocity", 1);
  ros::Publisher m_pub = n.advertise<kobuki_msgs::MotorPower>("mobile_base/commands/motor_power",1);
  geometry_msgs::Twist cmd;
  kobuki_msgs::MotorPower power_cmd;
  cmd.linear.x = 0.0;
  cmd.linear.y = 0.0;
  cmd.linear.z = 0.0;
  cmd.angular.x = 0.0;
  cmd.angular.y = 0.0;
  cmd.angular.z = 0.0;
  power_cmd.state = kobuki_msgs::MotorPower::OFF;

  puts("Reading from keyboard");
  puts("---------------------------");
  puts("Forward/back arrows : linear velocity incr/decr.");
  puts("Right/left arrows : angular velocity incr/decr.");
  puts("Spacebar : reset linear/angular velocities.");
  puts("d : disable motors.");
  puts("e : enable motors.");
  puts("q : quit.");
  puts("Commmand Key No Ato Ni Enter Wo Push Shitene!");
    
    while(ros::ok())
      {
	char c;
	std::cin >> c;
	pub.publish(cmd);
	m_pub.publish(power_cmd);
	
	switch (c)
	  {
	  case 65:
	    if(power_status)
	      {
		cmd.linear.x += 0.05;
		ROS_INFO_STREAM("KeyOp: linear  velocity incremented [" << cmd.linear.x << "|" << cmd.angular.z << "]");
	      }
	    else
	      {
		ROS_WARN_STREAM("KeyOp: motors are not yet powered up.");
	      }
	    break;
	  case 66:
	    if(power_status)
	      {
		cmd.linear.x -= 0.05;
		ROS_INFO_STREAM("KeyOp: linear  velocity incremented [" << cmd.linear.x << "|" << cmd.angular.z << "]");
	      }
	    else
	      {
		ROS_WARN_STREAM("KeyOp: motors are not yet powered up.");
	      }
	    break;
	  case 67:
	    if(power_status)
	      {
		cmd.angular.z += 0.33;
		ROS_INFO_STREAM("KeyOp: linear  velocity incremented [" << cmd.linear.x << "|" << cmd.angular.z << "]");
	      }
	    else
	      {
		ROS_WARN_STREAM("KeyOp: motors are not yet powered up.");
	      }
	    break;
	  case 68:
	    if(power_status)
	      {
		cmd.angular.z -= 0.33;
		ROS_INFO_STREAM("KeyOp: linear  velocity incremented [" << cmd.linear.x << "|" << cmd.angular.z << "]");
	      }
	    else
	      {
		ROS_WARN_STREAM("KeyOp: motors are not yet powered up.");
	      }
	    break;
	  case 32:
	    cmd.linear.x = 0.0;
	    cmd.angular.z = 0.0;
	    break;
	  case 'd':
	    if(power_status)
	      {
		kobuki_msgs::MotorPower power_cmd;
		power_cmd.state = kobuki_msgs::MotorPower::OFF;
		m_pub.publish(power_cmd);
		power_status = false;
		ROS_INFO("KeyOp: die, die, die (disabling power to the device's motor system).");
	      }
	    else
	      {
		ROS_WARN("KeyOp: Motor system has already been powered down.");
	      }
	    break;
	  case 'e':
	    if(!power_status)
	      {
		kobuki_msgs::MotorPower power_cmd;
		power_cmd.state = kobuki_msgs::MotorPower::ON;
		m_pub.publish(power_cmd);
		ROS_INFO("KeyOp: Enabling power to the device subsystem.");
		power_status = true;
		cmd.linear.x = 0.0;
		cmd.angular.z = 0.0;
		pub.publish(cmd);
	      }
	    else
	      {
		ROS_WARN("KeyOp: Device has already been powered up.");
	      }
	    break;
	  case 'q':
	    ros::shutdown();
	    break;
	  default:
	    {
	      break;
	    }
	  }
	
      }
  
  return 0;
}

5)エラー
6)
