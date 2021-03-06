# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

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
CMAKE_COMMAND = /opt/cmake/bin/cmake

# The command to remove a file.
RM = /opt/cmake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /opt/blockchain

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /opt/blockchain

# Include any dependencies generated for this target.
include CMakeFiles/daemon.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/daemon.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/daemon.dir/flags.make

message.pb.h: protos/message.proto
message.pb.h: /usr/local/bin/protoc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running cpp protocol buffer compiler on /opt/blockchain/protos/message.proto"
	/usr/local/bin/protoc --cpp_out /opt/blockchain -I /opt/blockchain/protos /opt/blockchain/protos/message.proto

message.pb.cc: message.pb.h
	@$(CMAKE_COMMAND) -E touch_nocreate message.pb.cc

CMakeFiles/daemon.dir/src/daemon.cpp.o: CMakeFiles/daemon.dir/flags.make
CMakeFiles/daemon.dir/src/daemon.cpp.o: src/daemon.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/daemon.dir/src/daemon.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/daemon.dir/src/daemon.cpp.o -c /opt/blockchain/src/daemon.cpp

CMakeFiles/daemon.dir/src/daemon.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/daemon.dir/src/daemon.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/blockchain/src/daemon.cpp > CMakeFiles/daemon.dir/src/daemon.cpp.i

CMakeFiles/daemon.dir/src/daemon.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/daemon.dir/src/daemon.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/blockchain/src/daemon.cpp -o CMakeFiles/daemon.dir/src/daemon.cpp.s

CMakeFiles/daemon.dir/message.pb.cc.o: CMakeFiles/daemon.dir/flags.make
CMakeFiles/daemon.dir/message.pb.cc.o: message.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/daemon.dir/message.pb.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/daemon.dir/message.pb.cc.o -c /opt/blockchain/message.pb.cc

CMakeFiles/daemon.dir/message.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/daemon.dir/message.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/blockchain/message.pb.cc > CMakeFiles/daemon.dir/message.pb.cc.i

CMakeFiles/daemon.dir/message.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/daemon.dir/message.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/blockchain/message.pb.cc -o CMakeFiles/daemon.dir/message.pb.cc.s

# Object files for target daemon
daemon_OBJECTS = \
"CMakeFiles/daemon.dir/src/daemon.cpp.o" \
"CMakeFiles/daemon.dir/message.pb.cc.o"

# External object files for target daemon
daemon_EXTERNAL_OBJECTS =

daemon: CMakeFiles/daemon.dir/src/daemon.cpp.o
daemon: CMakeFiles/daemon.dir/message.pb.cc.o
daemon: CMakeFiles/daemon.dir/build.make
daemon: /usr/lib/x86_64-linux-gnu/libboost_system.so
daemon: /usr/local/lib/libzmq.so
daemon: CMakeFiles/daemon.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable daemon"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/daemon.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/daemon.dir/build: daemon

.PHONY : CMakeFiles/daemon.dir/build

CMakeFiles/daemon.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/daemon.dir/cmake_clean.cmake
.PHONY : CMakeFiles/daemon.dir/clean

CMakeFiles/daemon.dir/depend: message.pb.h
CMakeFiles/daemon.dir/depend: message.pb.cc
	cd /opt/blockchain && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/blockchain /opt/blockchain /opt/blockchain /opt/blockchain /opt/blockchain/CMakeFiles/daemon.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/daemon.dir/depend

