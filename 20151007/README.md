#README.md

author: Jotaro Shigeyama 

03-143003 機械B　茂山丈太郎

20151007宿題です

##1.以下の質問に答えよ

###1 makeとcatkin_makeの違い
make:Makefileなるファイルに記述されたルールに従ってファイルの更新を行うツールのこと。更新する対象のファイルはtargetと呼ばれる。
catkin_make:catkin workspaceに存在するビルドコマンド。ROS固有のビルドシステムを構成するマクロ・インフラシステムである。膨大なパッケージを保有するROSのサポートを容易にするために用意されている。

###2 pythonなのになぜmakeするのか
ROSではmakeによってクライアントとサーバーを接続するためのPythonコードが別に自動生成されるため。

###3 ros::Spin() ros::SpinOnce() の違い
Spin()は、全ノードが廃棄されるまで実行し続ける命令。SpinOnce()はその地点で呼び出せるコールバック関数を呼び出す関数。

###4 actionファイルをコンパイルすると？

試しにshellで次のコマンドを入力。
ログの中身を検索してみる。

```

/build/build_logs $ grep action beginner_tutorials.log

Built target actionlib_msgs_generate_messages_py
[  0%] [  0%] [  0%] Built target actionlib_msgs_generate_messages_lisp
Built target actionlib_msgs_generate_messages_cpp
Scanning dependencies of target simple_action_client
[ 96%] [100%] Built target simple_action_server
Building CXX object CMakeFiles/simple_action_client.dir/src/simple_action_client.cpp.o
Linking CXX executable /home/mech-user/soft3/2015-soft3/20151007/devel/lib/beginner_tutorials/simple_action_client
[100%] Built target simple_action_client

```

ここにあるpyコードなどが追加されていると思われる。

##3 keyop.launchの中で立ち上がっているプログラムを調べて、そのプログラムとロボットを操作するのに必要なtopicとmeesage名は？

rostopic listで、実行中のプログラムを参照した。

```

mech-user@test1-pc:~$ rostopic list
/camera/depth/camera_info
/camera/depth/image_raw
/camera/depth/points
/camera/parameter_descriptions
/camera/parameter_updates
/camera/rgb/camera_info
/camera/rgb/image_raw
/clock
/depthimage_to_laserscan/parameter_descriptions
/depthimage_to_laserscan/parameter_updates
/gazebo/link_states
/gazebo/model_states
/gazebo/parameter_descriptions
/gazebo/parameter_updates
/gazebo/set_link_state
/gazebo/set_model_state
/joint_states
/laserscan_nodelet_manager/bond
/mobile_base/commands/motor_power
/mobile_base/commands/reset_odometry
/mobile_base/commands/velocity
/mobile_base/events/bumper
/mobile_base/events/cliff
/mobile_base/sensors/imu_data
/odom
/rosout
/rosout_agg
/scan
/tf

```

rosrun rqt_graph rqt_graphで調査すると、この内/mobile_base/commands/velocityのトピックが/gazeboノードにmessageを送信していることがわかる。
rosmsg listで調査すると

```
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
```

kobuki_msgsがこれだけのmessageをハンドルしていることもわかる。

###