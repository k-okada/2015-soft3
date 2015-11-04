1)
   1-1)catkin_makeでは、ワークスペースのsrc以下でcatkin_init_workspaceをしたあとに
       ワークスペース下にbuildというフォルダを作り、その中でcmakeとmakeを行う。
       また、同時にdevelというフォルダも作が作られ、中にsetup.~ができる。この中のど
       れかをsourceに指定することで環境変数を読み込んだりできるようになる。
   1-2)python以外のコードもあるから。また、作った.actionファイルや.srvファイルをpyt
       honのコードで読めるようにするため。
   1-3)ros::Spinは、ros::Shutdown()が呼ばれるかC-cが押されてノードが閉じられるまで
       コールバックを呼び続けるのに対して、ros::SupinOnceはその時点で呼ばれるのを待
       っているコールバックをよんで次にうつる。
   1-4)devel/include/beginner_tutorials以下にヘッダーファイルが作られる。
       DoDishes.actionの場合は、DoDishesAction.h,DoDishesActionResult.h,
       DoDishesResult.h, DoDishesActionFeedback.h, DoDishesFeedback.h,
       DoDishesActionGoal.h, DoDishesGoal.hが作られる。
2) 操作できた。
3) /mobile_base/commands/locity というトピックに、
linear: 
  x: 9.71445146547e-17
  y: 0.0
  z: 0.0
angular: 
  x: 0.0
  y: 0.0
  z: 6.6
というようなメッセージが流れていた。 
4) w,a,s,dを押すことで、マシンの前進、後退、左右回転の速度を送るpythonコードを書いた。(コードは20151007/src/beginner_tutorials/scriptsにあります。)
   turtlebotは動いたが、現状ではkey入力を待ってしまっているためその間は出版が止まっており、走り続けてくれない。
5) できた。
6) ゴールを指定すると、/move_base/goal にゴールの位置などのメッセージが流れる。