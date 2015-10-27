1)
1-1)makeはソースからプログラムを自動的にコンパイルする。コンパイラや等の指定はMakefileで行う。catkin_makeはROSで依存関係にある多くのソースをクロスコンパイルを行う。
1-2)メッセージなどに対応したPythonのコードを正しく自動生成するため。
1-3)サブスクライバにおいて、ros::Spin()はCtrl-Cなどを押さない限り受信するたびにコールバック関数を呼び出す。ros::SpinOnce()は一度だけコールバック関数を呼び出す。
1-4)DoDishesActionFeedback.h  
DoDishesGoal.h   
DoDishesActionGoal.h      
DoDishesResult.h  
DoDishesActionResult.h
DoDishesAction.h      
DoDishesFeedback.h

DoDishesAction.msg          
DoDishesActionResult.msg  
DoDishesResult.msg
DoDishesActionFeedback.msg  
DoDishesFeedback.msg
DoDishesActionGoal.msg      
DoDishesGoal.msg

2)操作しました。
3) topic
/mobile_base/commands/velocity
/mobile_base/commands/motor_power
/keyop/teleop
message
geometry_msgs/Twist
kobuki_msgs/MotorPower
kobuki_msgs/KeyboardInput
4)
5)
6)