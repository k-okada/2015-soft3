1)

1-1) 複数のpackageが共存する環境でのビルドを容易に行える。例えば、自動的にpackageを探す機能がある。

1-2) サービスファイルやメッセージファイルのコンパイルが必要だから

1-3) ros::spin()はnodeがシャットダウンされるまで繰り返しros::spinOnce()を呼び続ける

1-4) ActionClientとActionServerが内部で通信を行うために以下のようなファイルが生成される
DoDishesAction.msg

DoDishesActionGoal.msg

DoDishesActionResult.msg

DoDishesActionFeedback.msg

DoDishesGoal.msg

DoDishesResult.msg

DoDishesFeedback.msg


2) 実行した

3) rostopic listの結果
```
/camera/depth/camera_info
/camera/depth/image_raw
/camera/depth/points
/camera/parameter_descriptions
/camera/parameter_updates
/camera/rgb/camera_info
/camera/rgb/image_raw
/camera/rgb/image_raw/compressed
/camera/rgb/image_raw/compressed/parameter_descriptions
/camera/rgb/image_raw/compressed/parameter_updates
/camera/rgb/image_raw/compressedDepth
/camera/rgb/image_raw/compressedDepth/parameter_descriptions
/camera/rgb/image_raw/compressedDepth/parameter_updates
/camera/rgb/image_raw/theora
/camera/rgb/image_raw/theora/parameter_descriptions
/camera/rgb/image_raw/theora/parameter_updates
/clock
/cmd_vel_mux/active
/cmd_vel_mux/input/navi
/cmd_vel_mux/input/safety_controller
/cmd_vel_mux/input/teleop
/cmd_vel_mux/parameter_descriptions
/cmd_vel_mux/parameter_updates
/depthimage_to_laserscan/parameter_descriptions
/depthimage_to_laserscan/parameter_updates
/gazebo/link_states
/gazebo/model_states
/gazebo/parameter_descriptions
/gazebo/parameter_updates
/gazebo/set_link_state
/gazebo/set_model_state
/joint_states
/keyop/teleop
/laserscan_nodelet_manager/bond
/mobile_base/commands/motor_power
/mobile_base/commands/reset_odometry
/mobile_base/commands/velocity
/mobile_base/events/bumper
/mobile_base/events/cliff
/mobile_base/sensors/bumper_pointcloud
/mobile_base/sensors/core
/mobile_base/sensors/imu_data
/mobile_base_nodelet_manager/bond
```

4) 

5)　実行した

6)命令の実行中にでもその命令の実行状態を知ることができる

