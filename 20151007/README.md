# Shukudai
03-140295 安江秀太
1)
1-1) make はMakefileを用いてビルド, catkin_makeはcatkinによって自動生成されたROSに対応したCMakeListにしたがってビルドする.
ROSに必要なファイルがCMakeListやpackage.xmlにしたがって自動で用意されるため,
rosで実行するソースファイルをビルドするときには,
確実性や利便性において自分でMakefileを書くよりもcatkin_makeを用いるほうが良い．
1-2) pythonで書かれたコードの中で使用されるrosの構造体や，インスタンスの依存関係などを設定したり, subscribeやactionに必要なnodeやtopicなどを生成するファイルを作ったりする必要があるから．
1-3) ros::spin()はサーバなど常に入力待ち状態を保持したいときなどに用いられる無限ループ．コールバックを呼ぶときに用い, ノードが閉じるまで続く.
ros::spinOnce()はその場で一度だけコールバックを待つときに必要. 
2) 実行しました.
3) 
topic: mobile_base/commands/motor_power message: kobuki_msgs/MotorPower
topic: mobile_base/commands/velocity    message: geometry_msgs/Twist
4) mykeyop.pyにてlinear.x = 0.5,angular.z = 0.3
5) できませんでした．  