# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/meip-users/2015-soft3/20151007/src/beginner_tutorials

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/meip-users/2015-soft3/20151007/build/beginner_tutorials

# Include any dependencies generated for this target.
include CMakeFiles/add_two_ints_client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/add_two_ints_client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/add_two_ints_client.dir/flags.make

CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o: CMakeFiles/add_two_ints_client.dir/flags.make
CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o: /home/meip-users/2015-soft3/20151007/src/beginner_tutorials/src/add_two_ints_client.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/meip-users/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o -c /home/meip-users/2015-soft3/20151007/src/beginner_tutorials/src/add_two_ints_client.cpp

CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/meip-users/2015-soft3/20151007/src/beginner_tutorials/src/add_two_ints_client.cpp > CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.i

CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/meip-users/2015-soft3/20151007/src/beginner_tutorials/src/add_two_ints_client.cpp -o CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.s

CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.requires:
.PHONY : CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.requires

CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.provides: CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.requires
	$(MAKE) -f CMakeFiles/add_two_ints_client.dir/build.make CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.provides.build
.PHONY : CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.provides

CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.provides.build: CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o

# Object files for target add_two_ints_client
add_two_ints_client_OBJECTS = \
"CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o"

# External object files for target add_two_ints_client
add_two_ints_client_EXTERNAL_OBJECTS =

/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: CMakeFiles/add_two_ints_client.dir/build.make
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/libactionlib.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/libroscpp.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/librosconsole.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/liblog4cxx.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/librostime.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/libcpp_common.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client: CMakeFiles/add_two_ints_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/add_two_ints_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/add_two_ints_client.dir/build: /home/meip-users/2015-soft3/20151007/devel/lib/beginner_tutorials/add_two_ints_client
.PHONY : CMakeFiles/add_two_ints_client.dir/build

CMakeFiles/add_two_ints_client.dir/requires: CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.requires
.PHONY : CMakeFiles/add_two_ints_client.dir/requires

CMakeFiles/add_two_ints_client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/add_two_ints_client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/add_two_ints_client.dir/clean

CMakeFiles/add_two_ints_client.dir/depend:
	cd /home/meip-users/2015-soft3/20151007/build/beginner_tutorials && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/meip-users/2015-soft3/20151007/src/beginner_tutorials /home/meip-users/2015-soft3/20151007/src/beginner_tutorials /home/meip-users/2015-soft3/20151007/build/beginner_tutorials /home/meip-users/2015-soft3/20151007/build/beginner_tutorials /home/meip-users/2015-soft3/20151007/build/beginner_tutorials/CMakeFiles/add_two_ints_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/add_two_ints_client.dir/depend

