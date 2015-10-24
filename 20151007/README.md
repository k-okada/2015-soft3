1)  
1-1) makeは複雑な依存関係を持つ複数のファイルの処理を行うことができるコマンドであり、主としてプログラムのビルドに使われる。一方、catkin_make(授業ではcatkin build)はROSのcatkinビルドシステムにおけるビルドコマンドであり、ROSのソースコードをビルドすることができるが、makeと違ってビルド以外の処理は基本的に行えず、ビルドの対象もROSに限定されている。  
1-2) メッセージやサービスを使用するためのPythonコードの自動生成を確実に行うため。  
1-3) ros::Spin()はノードが終了するまでコールバックキューに入るサブスクライバーを実行し続けるが、ros::SpinOnce()は呼ばれた時のみコールバックキューに入っているサブスクライバーを実行して、すぐに終了する。  
1-4) ~/2015-soft3/20151007/devel/include/beginner_tutorials/以下に、DoDishesAction.h, DoDishesGoal.h, DoDishesFeedback.h, DoDishesResult.h, DoDishesActionGoal.h, DoDishesActionFeedback.h, DoDishesActionResult.hが生成される。また、~/2015-soft3/20151007/devel/share/beginner_tutorials/msg以下に、DoDishesAction.msg, DoDishesGoal.msg, DoDishesFeedback.msg, DoDishesResult.msg, DoDishesActionGoal.msg, DoDishesActionFeedback.msg, DoDishesActionResult.msgが生成される。  

2) 操作した。  

3)

4)

5)

6)
