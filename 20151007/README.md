1-1)	makeはファイルの開発環境に依存してしまうのに対し、
	catkin_makeはCMakeとmakeを組み合わせたようなものであり、開発環境に依存しないビ
	ルドツールであり、クロスプラットフォームでの開発を実現する。

1-2)	依存するファイルがあるため

1-3)	ros::Spin()はノードが閉じられるまでコールバック関数を呼び出さないのに対し、
	ros::SpinOnce()はその都度コールバック関数を呼び出す。

1-4)	
/20151007/devel/include/beginner_tutorials/
	DoDishesAction.h
	DoDishesActionFeedback.h
	DoDishesActionGoal.h
	DoDishesActionResult.h
	DoDishesFeedback.h
	DoDishesGoal.h
	DoDishesResult.h
/20151007/devel/share/beginner_tutorials/msg
	DoDishesAction.msg
	DoDishesActionFeedback.msg
	DoDishesActionGoal.msg
	DoDishesActionResult.msg
	DoDishesFeedback.msg
	DoDishesGoal.msg
	DoDishesResult.msg

2)略
3)topic:/mobile_base/commands/velocity
  message:gemoetry-msgs/Twist

4)よくわかりませんでした。
5)エラーがでました。
6)5と同様の理由でできませんでした。
