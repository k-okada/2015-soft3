cmake_minimum_required(VERSION 2.8.3)
project(enshu_20151209)

find_package(catkin REQUIRED COMPONENTS)
catkin_package()
add_definitions(-std=c++11)
add_executable(graphsearch src/graphsearch.cpp)
add_executable(Astar_search src/Astar_search.cpp)
