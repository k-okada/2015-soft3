#2015-soft3 1007
1)
	1-1)
	catkin_makeはワークスペース内で有効なパッケージをmakeと同様にビルドできる。

	1-2)
	makeすることでpythonのスクリプトがあることを認識してmsgやsrvのファイルからpython用のファイルを生成するため。

	1-3)
	spin()はnodeがシャットダウンするまで終了しないが, spinonce()は1回のコールバック呼び出しで終了してしまうので定期的に呼ばなければならない。

	1-4)
	ログをみると以下のようにあるのでmsgファイルが生成される。 
	Generating .msg files for action beginner_tutorials/DoDishes /home/mech-user/2015-soft3/20151007/src/beginner_tutorials/action/DoDishes.action
	結果は
	Generating for action DoDishes
	-- beginner_tutorials: 7 messages, 1 services
	なので
	devel/share/beginner_tutorials/msg以下に
	DoDishesAction.msg
	DoDishesActionFeedback.msg
	DoDishesActionGoal.msg
	DoDishesActionResult.msg
	DoDishesFeedback.msg
	DoDishesGoal.msg
	DoDishesResult.msg
	が作成される。これらのファイルを元にさらにc++, python, lispのコードが生成される。

2)
	モータのon/offをe/dで行い並進速度を↑↓, 回転速度を→←で調整できた。

3)
	プログラム名：opt/ros/indigo/lib/kobuki_key_op/keyop

	topic名：/mobile_base/commands/motor_power
	message名：state:0
	
	topic名：/mobile_base/commands/velocity
	message名：
		linear: 
  		  x: 0.0
  		  y: 0.0
 		  z: 0.0
		angular: 
  		  x: 0.0
  		  y: 0.0
  		  z: 0.0
		---
4)
e,d,qはおなじ
矢印は文字コードがなかったためjkmnを用いた。

#!/usr/bin/env python
import roslib
import rospy

from kobuki_msgs.msg import MotorPower
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Vector3


def check(val,val_max):
    #check value 
    if (val>val_max):
        return val_max
    
    elif(val<-val_max):
        return -val_max
    
    else:
        return val

def statepub(state,pub):
    #pubulish state 
    rospy.loginfo(state)
    pub.publish(MotorPower(state))
    print state
    rospy.sleep(1.0)

def velopub(liner,angular,pub):
    #set twist
    
    v=Vector3(liner,0.,0.)
    w=Vector3(0.,0.,angular)
    twist=Twist(v,w)
    
    #pubulish velocity
    rospy.loginfo(twist)
    pub.publish(twist)
    print twist
    rospy.sleep(1.0)
    

def keyop():
    
    pub1 = rospy.Publisher('/mobile_base/commands/motor_power',MotorPower,queue_size=10)
    pub2 = rospy.Publisher('/mobile_base/commands/velocity',Twist,queue_size=10)
    rospy.init_node('keyop')
    
    #init speed
    liner=0.0
    angular=0.0
    state=1

    #max speed
    liner_max=1.5
    angular_max=6.6
    
    while True:
        keyinput=raw_input('>')
        if(keyinput=='q'):
            #quit
            break
                
        elif(keyinput=='e'):
            #e:enable 
            state=1
            statepub(state,pub1)
            
        elif(keyinput=='d'):
            #d:disable
            state=0
            statepub(state,pub1)

                
        elif(keyinput=='j'):
            #j
            liner += 0.05
            liner = check(liner,liner_max)
            velopub(liner,angular,pub2)
    
        elif(keyinput=='k'):
            #k
            liner -= 0.05
            liner = check(liner,liner_max)
            velopub(liner,angular,pub2)

        elif(keyinput=='m'):
            #m
            angular += 0.33
            angular = check(angular,angular_max)
            velopub(liner,angular,pub2)

        elif(keyinput=='n'):
            #n
            angular -= 0.33
            angular = check(angular,angular_max)
            velopub(liner,angular,pub2)

if __name__ == '__main__':
    try:
        keyop()
    except rospy.ROSInterruptException: pass

5)
	実行できたが綺麗なマップを作成するのが難しかった。
6)
	/move_base/action_topicsというactionlib serverが立ち上がっている。
	内容は
	/move_base/cancel
	/move_base/current_goal
	/move_base/feedback
	/move_base/goal
	/move_base/parameter_descriptions
	/move_base/parameter_updates
	/move_base/result
	/move_base/status
	をやりとりしている。









