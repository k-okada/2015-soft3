cmake_minimum_required(VERSION 2.8.3)
project(beginner_tutorials)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  message_generation
  message_runtime
  roscpp
  rospy
  std_msgs
)

add_message_files(FILES Hello.msg)
generate_messages(DEPENDENCIES geometry_msgs)

catkin_package()

include_directories(${catkin_INCLUDE_DIRS})

add_executable(listener src/listener.cpp)
target_link_libraries(listener ${catkin_LIBRARIES})
add_executable(listener2 src/listener2.cpp)
target_link_libraries(listener2 ${catkin_LIBRARIES})

