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
include CMakeFiles/message.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/message.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/message.dir/flags.make

message.pb.h: protos/message.proto
message.pb.h: /usr/local/bin/protoc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running cpp protocol buffer compiler on /opt/blockchain/protos/message.proto"
	/usr/local/bin/protoc --cpp_out /opt/blockchain -I /opt/blockchain/protos /opt/blockchain/protos/message.proto

message.pb.cc: message.pb.h
	@$(CMAKE_COMMAND) -E touch_nocreate message.pb.cc

CMakeFiles/message.dir/message.pb.cc.o: CMakeFiles/message.dir/flags.make
CMakeFiles/message.dir/message.pb.cc.o: message.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/message.dir/message.pb.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/message.dir/message.pb.cc.o -c /opt/blockchain/message.pb.cc

CMakeFiles/message.dir/message.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/message.dir/message.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/blockchain/message.pb.cc > CMakeFiles/message.dir/message.pb.cc.i

CMakeFiles/message.dir/message.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/message.dir/message.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/blockchain/message.pb.cc -o CMakeFiles/message.dir/message.pb.cc.s

# Object files for target message
message_OBJECTS = \
"CMakeFiles/message.dir/message.pb.cc.o"

# External object files for target message
message_EXTERNAL_OBJECTS =

libmessage.a: CMakeFiles/message.dir/message.pb.cc.o
libmessage.a: CMakeFiles/message.dir/build.make
libmessage.a: CMakeFiles/message.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libmessage.a"
	$(CMAKE_COMMAND) -P CMakeFiles/message.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/message.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/message.dir/build: libmessage.a

.PHONY : CMakeFiles/message.dir/build

CMakeFiles/message.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/message.dir/cmake_clean.cmake
.PHONY : CMakeFiles/message.dir/clean

CMakeFiles/message.dir/depend: message.pb.h
CMakeFiles/message.dir/depend: message.pb.cc
	cd /opt/blockchain && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/blockchain /opt/blockchain /opt/blockchain /opt/blockchain /opt/blockchain/CMakeFiles/message.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/message.dir/depend

