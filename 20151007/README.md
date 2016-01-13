shukudai
1-1)
catkin_makeはCMakeでMakefileなどを生成してmakeするという手順を包括して行っている。
1-2)
CMakeを使いメッセージとサービスのための自動生成Pythonコードを作るため。
1-3)
Spin()はすべてのコールバック関数が呼ばれるのに対し、SpinOnce()はその時点で呼ばれるのを待っているコールバック関数を呼び出す。
1-4)
以下のmsgファイル：
goal - serversに新しいゴールを送るときに用いられる
cancel - serversに送ったリクエストをキャンセルするときに用いられる
status - システムの各ゴールの現在の状態をclientsに知らせるときに用いられる
feedback - 一定周期でゴールへの情報をclientsに送るときに用いられる
result - ゴールに到達した情報をclientsに送るときに用いられる
が生成され、ActionClientとActionServerの間の通信で使われる。

2)
操作しました。わりと操作しにくかったです。

3)
topic name:/keyop/teleop
type:/kobuki_msgs/KeyboardInput
      uint8 KeyCode_Right=67
      uint8 KeyCode_Left=68
      uint8 KeyCode_Up=65
      uint8 KeyCode_Down=66
      uint8 KeyCode_Space=32
      uint8 KeyCode_Enable=101
      uint8 KeyCode_Disable=100
      uint8 pressedKey
が/mobile_base/commands/velocity
/geometry_msgs/Twist -> /geometry_msgs/Vector3 linearと/geometry_msgs/anglar
のデータを配信している。

4)

5)完了
6)
