#README.md

author: Jotaro Shigeyama 

03-143003 機械B　茂山丈太郎

20151007宿題です

##1.以下の質問に答えよ

###1 makeとcatkin_makeの違い
make:Makefileなるファイルに記述されたルールに従ってファイルの更新を行うツールのこと。更新する対象のファイルはtargetと呼ばれる。
catkin_make:catkin workspaceに存在するビルドコマンド。ROS固有のビルドシステムを構成するマクロ・インフラシステムである。膨大なパッケージを保有するROSのサポートを容易にするために用意されている。

###2 pythonなのになぜmakeするのか
ROSではmakeによってクライアントとサーバーを接続するためのPythonコードが別に自動生成されるため。

###3 ros::Spin() ros::SpinOnce() の違い
Spin()は、全ノードが廃棄されるまで実行し続ける命令。SpinOnce()はその地点で呼び出せるコールバック関数を呼び出す関数。

###4 actionファイルをコンパイルすると？

試しに次のコマンドを入力


```

/build/build_logs $ grep action beginner_tutorials.log

Built target actionlib_msgs_generate_messages_py
[  0%] [  0%] [  0%] Built target actionlib_msgs_generate_messages_lisp
Built target actionlib_msgs_generate_messages_cpp
Scanning dependencies of target simple_action_client
[ 96%] [100%] Built target simple_action_server
Building CXX object CMakeFiles/simple_action_client.dir/src/simple_action_client.cpp.o
Linking CXX executable /home/mech-user/soft3/2015-soft3/20151007/devel/lib/beginner_tutorials/simple_action_client
[100%] Built target simple_action_client

```

