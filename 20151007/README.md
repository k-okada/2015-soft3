1-1)makeはUNIX系列だけを支援する。一方、catkin_makeは、CMakeをROS用に変更したcatkinというビルドシステムを使って、UNIX以外のOS、特にWINDOWS系列も支援する。また、catkinはパッケージ管理、パッケージ依存関係も便利に使わせる。
1-2)メッセージなどの、ノード間通信のために自動生成されるpython codeが必要であるため
1-3)ros::spin()とros::spinOnce()はROS通信を処理する。ros::spin()はノードが終了するまでreturnを返さないことに比べ、ros::spinOnce()は即座にreturnを返す。
1-4)DoDishesAでfindをすると
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesAction.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionGoal.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionResult.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionFeedback.lisp
./devel/share/beginner_tutorials/msg/DoDishesActionResult.msg
./devel/share/beginner_tutorials/msg/DoDishesAction.msg
./devel/share/beginner_tutorials/msg/DoDishesActionGoal.msg
./devel/share/beginner_tutorials/msg/DoDishesActionFeedback.msg
./devel/include/beginner_tutorials/DoDishesActionResult.h
./devel/include/beginner_tutorials/DoDishesAction.h
./devel/include/beginner_tutorials/DoDishesActionFeedback.h
./devel/include/beginner_tutorials/DoDishesActionGoal.h

