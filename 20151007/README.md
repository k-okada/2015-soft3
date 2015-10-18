#Question 1
1-1)
catkin
:= (ROSにおけるビルドシステムのマクロ＆インフラの総称。CMakeのマクロとPythonのスクリプトを複合することでよりCMakeより高等な機能を有するようになり、またパッケージのリンク/配布がしやすくなった)

make
-> Makefileに書き込む
catkin_make
-> CMakefile.txtにマクロを書き込むpackage.xmlにもろもろのメタファイルが書き込まれており基本構成は以下の通りである
  my_package/
  +-CMakeLists.txt
  +-package.xml
なおソースコードは初期段階でなくても動作する

1-2)
c/c++におけるmakeとは異なり、パッケージの構成に実行ファイルを追加している
->ビルドごとに"パッケージ"として再構成されている？

1-3)
ros::spin()
-> callback関数をプログラムがシャットダウンするまで呼び続ける。すなわちros::shutdown() / Ctrl-Cまでcallback関数の呼び出しは終了しない
ros::spinOnce()
-> callback関数を一度だけ呼び出す

1-4)
./20151007/以下'DoDishesAction'を含むファイル一覧
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesAction.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesResult.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesFeedback.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionGoal.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionResult.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesActionFeedback.lisp
./devel/share/common-lisp/ros/beginner_tutorials/msg/DoDishesGoal.lisp
./devel/share/beginner_tutorials/msg/DoDishesGoal.msg
./devel/share/beginner_tutorials/msg/DoDishesFeedback.msg
./devel/share/beginner_tutorials/msg/DoDishesActionResult.msg
./devel/share/beginner_tutorials/msg/DoDishesAction.msg
./devel/share/beginner_tutorials/msg/DoDishesActionGoal.msg
./devel/share/beginner_tutorials/msg/DoDishesResult.msg
./devel/share/beginner_tutorials/msg/DoDishesActionFeedback.msg
./devel/include/beginner_tutorials/DoDishesActionResult.h
./devel/include/beginner_tutorials/DoDishesAction.h
./devel/include/beginner_tutorials/DoDishesGoal.h
./devel/include/beginner_tutorials/DoDishesActionFeedback.h
./devel/include/beginner_tutorials/DoDishesActionGoal.h
./devel/include/beginner_tutorials/DoDishesFeedback.h
./devel/include/beginner_tutorials/DoDishesResult.h
./build/beginner_tutorials/catkin_generated/stamps/beginner_tutorials/DoDishes.action.stamp
./src/beginner_tutorials/action/DoDishes.action

#Question2
操作難しい

#Question3
保留

#Question4
保留

#Question5
保留

#Question6
保留
