1-1)
makeは一つ一つのプログラムに対しMakefileを用意しておきコンパイルするのに対し、catkin_makeはROSのように、独立したパッケージ間で使用している言語やツールが異なる場合にも同様に使用することができる。

1-2)
他のプログラムと通信する際に使用するコードを適切に生成するため。

1-3)
どちらもcallback関数の値を返すものだが、Spin()はノードが終了する（shutdown()が呼ばれるかCtrl-Cが押される）まで値を返さないが、SpinOnce()はすべての値をすぐに返す。

2)
操作しました。

3)

~$ cat keyop.launch
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

始めにkobuki_keyopというパッケージの中のkeyopというファイルを実行しスクリーンに表示していることがわかる。
次にremapタグでkeyop/cmd_velというtopicとkeyop/cmd_velというtopicから情報を取ってきてto以下のtopicを書き変えている。

~$ rostopic list
/keyop/teleop
/mobile_base/commands/motor_power
/mobile_base/commands/velocity
/rosout
/rosout_agg

ここからも上記のtopicが使われていることがわかる。

次にmesssage名だが、

~$ rosmsg list keyop
を実行するとおそらくturtlebotのシミュレーションに関わるすべてのmessageが表示されてしまったので、このlaunchで用いられているkobukiパッケージのものに限ると、

kobuki_msgs/AutoDockingAction
kobuki_msgs/AutoDockingActionFeedback
kobuki_msgs/AutoDockingActionGoal
kobuki_msgs/AutoDockingActionResult
kobuki_msgs/AutoDockingFeedback
kobuki_msgs/AutoDockingGoal
kobuki_msgs/AutoDockingResult
kobuki_msgs/BumperEvent
kobuki_msgs/ButtonEvent
kobuki_msgs/CliffEvent
kobuki_msgs/ControllerInfo
kobuki_msgs/DigitalInputEvent
kobuki_msgs/DigitalOutput
kobuki_msgs/DockInfraRed
kobuki_msgs/ExternalPower
kobuki_msgs/KeyboardInput
kobuki_msgs/Led
kobuki_msgs/MotorPower
kobuki_msgs/PowerSystemEvent
kobuki_msgs/RobotStateEvent
kobuki_msgs/ScanAngle
kobuki_msgs/SensorState
kobuki_msgs/Sound
kobuki_msgs/VersionInfo
kobuki_msgs/WheelDropEvent

となった。

4)
5)
6)