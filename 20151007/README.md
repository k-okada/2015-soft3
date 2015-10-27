1-1)makeはUNIX系列だけを支援する。一方、catkin_makeは、CMakeをROS用に変更したcatkinというビルドシステムを使って、UNIX以外のOS、特にWINDOWS系列も支援する。また、catkinはパッケージ管理、パッケージ依存関係も便利に使わせる。
1-2)メッセージなどの、ノード間通信のために自動生成されるpython codeが必要であるため
1-3)ros::spin()とros::spinOnce()はROS通信を処理する。ros::spin()はノードが終了するまでreturnを返さないことに比べ、ros::spinOnce()は即座にreturnを返し、ただ一回callbackを呼ぶ。
1-4)DoDishesAでfindをすると
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesAction.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionGoal.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionResult.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionFeedback.lisp
./devel/share/beginner_tutorials/msg/DoDishesActionResult.msg
./devel/share/beginner_tutorials/msg/DoDishesAction.msg
./devel/share/beginner_tutorials/msg/DoDishesActionGoal.msg
./devel/share/beginner_tutorials/msg/DoDishesActionFeedback.msg
./devel/include/beginner_tutorials/DoDishesActionResult.h
./devel/include/beginner_tutorials/DoDishesAction.h
./devel/include/beginner_tutorials/DoDishesActionFeedback.h
./devel/include/beginner_tutorials/DoDishesActionGoal.h
2)操作出来ました
3)keyop.launchの中身は次のようです
<!--
  Raw keyop configuration for working with the default kobuki launcher (minimal.launch). 
 -->
<launch>
  <node pkg="kobuki_keyop" type="keyop" name="keyop" output="screen">
    <remap from="keyop/motor_power" to="mobile_base/commands/motor_power"/>
    <remap from="keyop/cmd_vel" to="mobile_base/commands/velocity"/>
    <param name="linear_vel_step"  value="0.05" type="double"/>
    <param name="linear_vel_max"   value="1.5"  type="double"/>
    <param name="angular_vel_step" value="0.33" type="double"/>
    <param name="angular_vel_max"  value="6.6"  type="double"/>
    <param name="wait_for_connection_" value="true" type="bool"/>
  </node>
</launch>
kobuki_keyopパッケージの中のkeyopというプログラムが走ると思われます。
topicはmobile_base/commands/motor_powerとmobile_base/commands/velocityの二つです。
使われているメッセージはgeometry_msgs.msgのTwistと、kobuki.msgのMotorPowerの二つです。

Twistの中身は
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

であり、Vector3も同じ場所に既にあって、

# This represents a vector in free space. 

float64 x
float64 y
float64 z

でした。

MotorPowerメッセージの中身は
# Turn on/off Kobuki's motors
# State
uint8 OFF = 0
uint8 ON  = 1

uint8 state



4)
#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from kobuki_msgs.msg import MotorPower

def move():
    pub1=rospy.Publisher('mobile_base/commands/velocity',Twist,queue_size=29)
    pub2=rospy.Publisher('mobile_base/commands/motor_power',MotorPower,queue_size=32)
    rospy.init_node('my_keyop')
    MotorPower.state=1
    pub2.publish(MotorPower)
    while not rospy.is_shutdown():
        Twist.linear=[0.2,0.0,0.0]
        Twist.angular=[0.0,0.0,0.1]
    
        pub1.publish(Twist)
        rospy.sleep(0.1)



if __name__=='__main__':
    try:
        move()
    except rospy.ROSInterruptException:
        pass

とりあえず指定した速度で動きそうなものを書きました。
でもうまく実行できませんですね。。

5)出来ました。

6)amcl_demo.launchだけを実行して、rqt_graphで確認すると/amclというノードが立ち上がったことが確認できました。
mech-user@test1-pc:~$ rostopic info /tf
Type: tf2_msgs/TFMessage

Publishers: 
 * /amcl (http://test1-pc:50916/)

Subscribers: 
 * /amcl (http://test1-pc:50916/)
 * /move_base (http://test1-pc:38679/)


mech-user@test1-pc:~$ rosnode info /amcl
--------------------------------------------------------------------------------
Node [/amcl]
Publications: 
 * /particlecloud [geometry_msgs/PoseArray]
 * /tf [tf2_msgs/TFMessage]
 * /rosout [rosgraph_msgs/Log]
 * /amcl_pose [geometry_msgs/PoseWithCovarianceStamped]
 * /amcl/parameter_descriptions [dynamic_reconfigure/ConfigDescription]
 * /amcl/parameter_updates [dynamic_reconfigure/Config]

Subscriptions: 
 * /tf [tf2_msgs/TFMessage]
 * /scan [unknown type]
 * /tf_static [unknown type]
 * /initialpose [unknown type]
 * /clock [unknown type]

Services: 
 * /global_localization
 * /set_map
 * /request_nomotion_update
 * /amcl/set_logger_level
 * /amcl/set_parameters
 * /amcl/get_loggers


contacting node http://test1-pc:50916/ ...
Pid: 14312
Connections:
 * topic: /rosout
    * to: /rosout
    * direction: outbound
    * transport: TCPROS
 * topic: /tf
    * to: /amcl
    * direction: outbound
    * transport: INTRAPROCESS
 * topic: /tf
    * to: /move_base
    * direction: outbound
    * transport: TCPROS
 * topic: /tf
    * to: /amcl (http://test1-pc:50916/)
    * direction: inbound
    * transport: INTRAPROCESS

rostopic echo /tf
を実行してみると、
---
transforms: 
  - 
    header: 
      seq: 0
      stamp: 
        secs: 55
        nsecs: 180000000
      frame_id: base_link
    child_frame_id: wheel_left_link
    transform: 
      translation: 
        x: 0.0
        y: 0.115
        z: 0.025
      rotation: 
        x: -0.706392821473
        y: -0.0317676213972
        z: -0.0317676213974
        w: 0.706392821476
  - 
    header: 
      seq: 0
      stamp: 
        secs: 55
        nsecs: 180000000
      frame_id: base_link
    child_frame_id: wheel_right_link
    transform: 
      translation: 
        x: 0.0
        y: -0.115
        z: 0.025
      rotation: 
        x: -0.326142324948
        y: 0.627400337803
        z: 0.627400337806
        w: 0.32614232495

のようなメッセージを聞くことが出来ました。多分、瞬間の右車輪と左車輪の位置、角度の変化情報をpublishするものだと思います。
