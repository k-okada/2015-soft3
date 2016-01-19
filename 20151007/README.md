1)
1-1) makeはC言語をコンパイルするを簡略化するためのコマンドであるがcatkin_makeやcatkin buildはrosのパッケージやsrv,msgといった依存関係をすべて統合してコンパイルするものである。
1-2) Pythonは実際はコンパイルしておりpycファイルを生成して実行速度をあげている。
1-3) ros::Spin()とはコールバック関数を何度も呼び出すものであるがros::SpinOnce()はコールバック関数を一度しか呼び出さない

2) おこなうことができました

3) まず/keyopというプログラムが立ち上がり/keyop/teleopというtopicにkobuki_msgs/KeyboardInputというmsgが入る。この/keyop/teleopを/keyopがsubscribeしており、受け取ったデータから/mobile_baseというプログラムに対して/mobile_base/commands/motor_powerと/mobile_base/commands/velocityというtopicをpublishしている。
このtopicはそれぞれkobuki_msgs/MotorPowerとgeometry_msgs/Twistというmsgを格納している。

4)5)6)
