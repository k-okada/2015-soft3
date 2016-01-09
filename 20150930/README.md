1. fork http://github.com/k-okada/2015_soft3

2. clone forked repo.
  ```
  git clone http://github.com/<yourname>/2015_soft3
  cd 2015_soft3/20150930/
  ```

3. create package
  ```
  mkdir src
  cd src
  catkin create pkg beginner_tutorials --catkin-deps std_msgs geometry_msgs rospy roscpp message_generation message_runtime
  cd ..
  catkin build 
  source devel/setup.bash
  ```

4. add talker and listener program, and talker2 and listener2 program
5. check your program
  
  ```
    cd ~/2015_soft3/20150930/src/beginner_tutorials/
    cp ../../*.test .
    rostest ./check1.test
    rostest ./check2.test
  ```