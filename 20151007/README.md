1)  
1-1) makeは複雑な依存関係を持つ複数のファイルの処理を行うことができるコマンドであり、主としてプログラムのビルドに使われる。一方、catkin_make(授業ではcatkin build)はROSのcatkinビルドシステムにおけるビルドコマンドであり、ROSのソースコードをビルドすることができるが、makeと違ってビルド以外の処理は基本的に行えず、ビルドの対象もROSに限定されている。  
1-2) メッセージやサービスを使用するためのPythonコードの自動生成を確実に行うため。  
1-3) ros::Spin()はノードが終了するまでコールバックキューに入るサブスクライバーを実行し続けるが、ros::SpinOnce()は呼ばれた時のみコールバックキューに入っているサブスクライバーを実行して、すぐに終了する。  
1-4) ~/2015-soft3/20151007/devel/include/beginner_tutorials/以下に、DoDishesAction.h, DoDishesGoal.h, DoDishesFeedback.h, DoDishesResult.h, DoDishesActionGoal.h, DoDishesActionFeedback.h, DoDishesActionResult.hが生成される。また、~/2015-soft3/20151007/devel/share/beginner_tutorials/msg以下に、DoDishesAction.msg, DoDishesGoal.msg, DoDishesFeedback.msg, DoDishesResult.msg, DoDishesActionGoal.msg, DoDishesActionFeedback.msg, DoDishesActionResult.msgが生成される。  

2) 操作した。  

3) keyopのソースコードでは、メッセージ型がgeometry_msgs/Twistのトピックkeyop/cmd_velにロボットの速度を送っているようだが、そのトピック名をkeyop.launchでmobile_base/commands/velocityにリマップしている。つまり、mobile_base/commands/velocityにロボットの速度を送れば、ロボットが動く。  

4) 以下のようなプログラムを書けば良い。  

```cpp:my_keyop.cpp

#include "ros/ros.h"
#include "geometry_msgs/Twist.h"

#include <sstream>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "my_keyop");
  ros::NodeHandle n;
  ros::Publisher vel_pub = n.advertise<geometry_msgs::Twist>("mobile_base/commands/velocity", 1);
  geometry_msgs::Twist cmd;
  cmd.linear.x = 0.0;
  cmd.linear.y = 0.0;
  cmd.linear.z = 0.0;
  cmd.angular.x = 0.0;
  cmd.angular.y = 0.0;
  cmd.angular.z = 0.0;

  std::cout << "Reading from keyboard" << std::endl;
  std::cout << "---------------------------" << std::endl;
  std::cout << "k/j : linear velocity incr/decr." << std::endl;
  std::cout << "h/l : angular velocity incr/decr." << std::endl;
  std::cout << "c : send current linear/angular velocities." << std::endl;
  std::cout << "r : reset linear/angular velocities." << std::endl;
  std::cout << "q : quit." << std::endl;
  std::cout << "Hit enter after each command." << std::endl;

  while(ros::ok())
  {
    char c = 'i';

    vel_pub.publish(cmd);
    std::cin >> c;
    switch (c)
    {
      case 'k':
        cmd.linear.x += 0.05;
        break;
      case 'j':
        cmd.linear.x -= 0.05;
        break;
      case 'h':
        cmd.angular.z += 0.33;
        break;
      case 'l':
        cmd.angular.z -= 0.33;
        break;
      case 'c':
        break;
      case 'r':
        cmd.linear.x = 0;
        cmd.angular.z = 0;
        break;
      case 'q':
        ros::shutdown();
        break;
    }
  }

  return 0;
}
```

5)

6)
