1-1)
catkin_makeはCMakeに自動で'find_package'する機能や、独立したプロジェクトを同時に複数ビルドする機能を追加したもので、makeと比べて、クロスプラットフォームであるという点などで異なる。
http://wiki.ros.org/catkin/conceptual_overviewを参考にした

1-2)
パッケージの依存関係を構築する作業を行うため
http://wiki.ros.org/catkin/Tutorials/using_a_workspaceを参考にした

1-3)
ros::Spin()は、ノードが閉じられるまでcallback関数を呼びつづける
ros::SpinOnce()は一度だけcallback関数を呼ぶ
http://wiki.ros.org/roscpp/Overview/Callbacks%20and%20Spinningを参考にした

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

のようなファイルが生成される。

2)
上下で速度、左右で角速度を加減しました。
操作が難しい。

3)
モータのONOFF
topic名:/mobile_base/commands/motor_power
message名:kobuki_msgs/MotorPower
中身:
uint8 OFF=0
uint8 ON=1
uint8 state

ロボットの速度
topic名:/mobile_base/commands/velocity
message名:geometry_msgs/Twist
中身:
geometry_msgs/Vector3 linear
  float64 x
  float64 y
  float64 z
geometry_msgs/Vector3 angular
  float64 x
  float64 y
  float64 z

4)
コマンドライン引数で速度と角速度を決められるプログラムを書いた
beginner_tutorials/scripts/problem4.py

#!/usr/bin/env python
import rospy
import sys

from std_msgs.msg import String
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import Twist
from kobuki_msgs.msg import MotorPower


def problem4(a, b):
	pubTwist = rospy.Publisher('mobile_base/commands/velocity', Twist, queue_size=10)
	pubMotorPower = rospy.Publisher('mobile_base/commands/motor_power', MotorPower, queue_size=10)
	rospy.init_node('problem4')
	
	pubMotorPower.publish(1)
	
	v_x = a * 1.
	omega_z = b * 1.
	
	while not rospy.is_shutdown():
		v =  Vector3(v_x, 0., 0.)
		omega = Vector3(0., 0., omega_z)
		twist = Twist(v, omega)
		pubTwist.publish(twist)
		print twist
		rospy.sleep(1.0)

if __name__ == '__main__':
	try:
		argv = sys.argv
		argc = len(argv)
		if (argc != 3):
			print "Usage: problem4 v_x omega_z"
			quit()
		v_x = float(argv[1])
		omega_z = float(argv[2])	
		problem4(v_x, omega_z)
	except rospy.ROSInterruptException:
		pass

5,6)
roslaunch turtlebot_gazebo turtlebot_world.launchで
[robot_pose_ekf-5] process has died [pid 17343, exit code -6, cmd /opt/ros/indigo/lib/robot_pose_ekf/robot_pose_ekf imu_data:=turtlebot_node/imu/data robot_pose_ekf/odom:=odom_combined __name:=robot_pose_ekf __log:=/home/mech-user/.ros/log/13d9cfa0-7c03-11e5-8ec6-e8b1fce891d5/robot_pose_ekf-5.log].

Error [Plugin.hh:156] Failed to load plugin libgazebo_ros_create.so: libgazebo_ros_create.so: cannot open shared object file: No such file or directory
というエラーがでてあきらめた

