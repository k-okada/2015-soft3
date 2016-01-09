1)
1-1) makeとcatkin_makeの違い
makeはパッケージ内で実行することによりそのプロジェクトのみビルドするもので，catkin_makeはワークスペースで実行することによりそのワークスペースに含まれる全てのパッケージをビルドするものである．

1-2) pythonをmakeする理由
makeすることでそのプログラムの実行に必要なpythonコードが自動生成されるため．

1-3) ros::Spin()とros::SpinOnce()の違い
ros::Spin()ではros::shutdownやC-cによりプログラムが終了するか，ros::ok()がfalseを返すまでコールバック関数を呼び出すことを繰り返す．ros::SpinOnce()では一度のみコールバック関数を呼び出す．

1-4) actionファイルのコンパイルでできるファイル
DoDishesAction，DoDishesActionFeedback，DoDishesActionGoal，DoDishesActionResult，DoDishesFeedback，DoDishesGoal，DoDishesResultに対して，それぞれ.h，.py，.pyc，.msg，.lisp拡張子を持つファイル，_package_~.lispファイルが生成する．またそれぞれに対してDependInfo.cmake，cmake_clean.cmake，depend.make，build.make，depend.internal，progress.makeの6つのビルドのためのファイルを持つディレクトリが生成される．
DoDishesAction
DoDishesActionFeedback
DoDishesActionGoal
DoDishesActionResult
DoDishesFeedback
DoDishesGoal
DoDishesResult
について，
DoDishesGoalではクライアントからのメッセージをstr型に変換し，DoDishesActionGoalでそれをサーバのゴールに設定する．同様にDoDishesActionFeedbackではサーバの状態（作業がどこまで進んだか）をDoDishesFeedbackで変換したものをクライアントに渡し，DoDishesActionResultではサーバがゴールに到達した状態をDoDishesResultで変換してクライアントに渡している．DoDishesActionはそれを実際に行うためのプログラムである．
catkin_generated/stamps/beginner_tutorials/DoDishes.action.stamp
も生成されたがこの中身はDoDishes.actionと同じものであった．

2)turtlebot_simulatorの実行・操作
省略

3)keyop.launch
topic名:/mobile_base/commands/velocity，/mobile_base/commands/motor_power,/keyop/teleop(配信していない)

message名:それぞれgeometry_msgs/Twist,kobuki_msgs/MotorPower,kobuki_msgs/KeyboardInput
またパラメータは以下のようであった．
geometry_msgs/Twist
geometry_msgs/Vector3 linear
  float64 x
  float64 y
  float64 z
geometry_msgs/Vector3 angular
  float64 x
  float64 y
  float64 z
(矢印上下でxがプラスマイナス0.05，左右でzがプラスマイナス0.33)

kobuki_msgs/MotorPower
uint8 OFF=0
uint8 ON=1
uint8 state

kobuki_msgs/KeyboardInput 
uint8 KeyCode_Right=67
uint8 KeyCode_Left=68
uint8 KeyCode_Up=65
uint8 KeyCode_Down=66
uint8 KeyCode_Space=32
uint8 KeyCode_Enable=101
uint8 KeyCode_Disable=100
uint8 pressedKey

4)keyop.launchと同様の働きをするプログラム
key.pyとしてPRした．
矢印キーの取得が難しかったため（pygameを使うと楽に実装できそうであった），上下左右をwsadに割り当て，oでモータON,pでモータOFFになるようにした．

5)amcl_demo.launchの実行まで
省略（.pgmファイルと.yamlファイルができ，後者を与えると生成マップの範囲を動くことができた．）

6)amcl_demo.launchの実行で立ち上がるactionlibサーバ
map_serverが立ち上がり，/mapトピックを通じて/move_baseにデータを渡していた．/move_baseには様々なパラメータを設定するファイルがあるが，主として/move_base/DWAPlannerROSにマップ情報を渡し，そこでスタートからゴールまでの道筋と速度の計算を行っているものと思われる．

