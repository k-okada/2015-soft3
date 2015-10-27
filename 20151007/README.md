1-1) makeとcatkin_makeの違い
makeは複数のソースファイルのコンパイルの仕方や依存関係を記述したMakefileから、ファイルをまとめてコンパイル、ビルドする方法である。これだけでは複数のプロジェクトを管理するのが難しい。catkin_makeは更に機能を拡張してROSのいろいろなパッケージを扱うことを可能にしたものである。

1-2) pythonのmakeをする理由
依存しているパッケージがあるから。

1-3) ros::Spin()とros::SpinOnce()の違い
ros::SpinOnce()はコールバックを呼ぶものであり、ros::Spin()はノードが終了するまでそれを続けるものである。

1-4)actionファイルのコンパイル
DoDishes.actionをコンパイルすると、DoDishesGoal.msg, DoDishesFeedback.msg,DoDishResult.msgといったメッセージファイルができる。それぞれアクションファイルの中で定義した型を持ち、命令の伝達、実行状況、実行結果を送るようにアクションサーバ、アクションクライアント間でやりとりされる。

2)turtlebot_simulator, key_op.launchの実行
実行できた。

3)keyop.launchの中身
keyop.launchではkobuki_keyopというノードを呼んでいる。
/opt/ros/indigo/include/kobuki_keyop/include/keyop_core/内のkeyop_core.hppが読み込まれて使われているようだ。
その中では、keyinputのサブスクライバ、velocity,motor_powerのパブリッシャがあり、メッセージはgeometry_msgs::TwistPtr, geometry_msgs::TwistStampedPtr, kobuki_msgs::KeyboardInputを使っているようだが、どう使われているのかはよくわからなかった。

4)keyop.launchと同じことをする
わからなかった。

5)amcl_demo.launch
mapが保存できなかった。