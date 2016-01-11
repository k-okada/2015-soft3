1.
1-1)
makeはコンパイラに依存したビルドである。
catkin_makeはCMakeをROS向けに最適化したもので、クロスプラットフォームに対応しており、コンパイラに依存しない。

1-2)
メッセージとサービスのためのPythonコードが自動生成されるのを確実にするため。

1-3)
ros::Spin()はノードがシャットダウンされたり、ros::shutdownやCtrl+Cでアプリケーションが中断された際にコールバック関数を呼び出す。
それに対し、ros::SpinOnce()はros::SpinOnce()に処理が到達した時点でコールバック関数を呼び出す。

1-4)
DoDishesAction.msg
DoDishesActionGoal.msg
DoDishesActionResult.msg
DoDishesActionFeedback.msg
DoDishesGoal.msg
DoDishesResult.msg
DoDishesFeedback.msg

2.
操作した。

3.
Turtlebotの速度を決めるには、
Topic: /mobile_base/commands/velocity
Message: /geometry_msgs/Twist

TurtlebotのモーターのONOFFを決めるには、
Topic: /mobile_base/commands/motor_power
Message: /kobuki_msgs/MotorPower

4.
Python2.7.6で書いた。

#### Main.py ####
#!/usr/bin/env python

import rospy
import sys
from Getch import _Getch
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Vector3
from kobuki_msgs.msg import MotorPower

def keyop():
    pub = rospy.Publisher("/mobile_base/commands/velocity",Twist,queue_size = 10)
    pub2 = rospy.Publisher("/mobile_base/commands/motor_power",MotorPower,queue_size = 10)
    rospy.init_node('keyop',anonymous = True)
    r = rospy.Rate(10)

    count = 0
    x = 0.0
    z = 0.0

    getch = _Getch()

    while not rospy.is_shutdown():
        c = getch()
        if(c == 'i'): #up
            if(x < 1.5):
                x += 0.05
        elif(c == 'k'): #bottom
            if(x > -1.5):
                x -= 0.05
        elif(c == 'j'): #left
            if(z < 6.6):
                z += 0.03
        elif(c == 'l'): #right
            if(z > -6.6):
                z -= 0.03
        elif(c == 'z'): #reset
            x = z = 0.0
        elif(c == 'e'): #motor enable
            pub2.publish(1)
            print 'on'
        elif(c == 'd'): #motor disable
            pub2.publish(0)
            print 'off'
        elif(c == 'q'): #quit
            sys.exit(1)

        a = Vector3(x, 0.0, 0.0)
        b = Vector3(0.0, 0.0, z)
        tw = Twist(a, b)
        pub.publish(tw)
        r.sleep()  


if __name__ == '__main__':
    try:
        keyop()
    except rospy.ROSInterruptException: pass
#################

_Getchクラスはnon blockingのキー入力のためのクラスで、
http://code.activestate.com/recipes/134892/
のものを利用した。
またこの関数の性質上、無入力状態ではキー入力を待ってしまうのと、
過剰に入力した場合文字が端末上に表示されてしまうので、
ログが見づらくなるので、ログ出力は実装しなかった。

5.
警告が出て上手く動作しなかった．

6.
5ができないのでできなかった．