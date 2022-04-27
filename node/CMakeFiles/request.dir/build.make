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
include CMakeFiles/request.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/request.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/request.dir/flags.make

request.pb.h: protos/request.proto
request.pb.h: /usr/local/bin/protoc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running cpp protocol buffer compiler on /opt/blockchain/protos/request.proto"
	/usr/local/bin/protoc --cpp_out /opt/blockchain -I /opt/blockchain/protos /opt/blockchain/protos/request.proto

request.pb.cc: request.pb.h
	@$(CMAKE_COMMAND) -E touch_nocreate request.pb.cc

CMakeFiles/request.dir/request.pb.cc.o: CMakeFiles/request.dir/flags.make
CMakeFiles/request.dir/request.pb.cc.o: request.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/request.dir/request.pb.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/request.dir/request.pb.cc.o -c /opt/blockchain/request.pb.cc

CMakeFiles/request.dir/request.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/request.dir/request.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/blockchain/request.pb.cc > CMakeFiles/request.dir/request.pb.cc.i

CMakeFiles/request.dir/request.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/request.dir/request.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/blockchain/request.pb.cc -o CMakeFiles/request.dir/request.pb.cc.s

# Object files for target request
request_OBJECTS = \
"CMakeFiles/request.dir/request.pb.cc.o"

# External object files for target request
request_EXTERNAL_OBJECTS =

librequest.a: CMakeFiles/request.dir/request.pb.cc.o
librequest.a: CMakeFiles/request.dir/build.make
librequest.a: CMakeFiles/request.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/opt/blockchain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library librequest.a"
	$(CMAKE_COMMAND) -P CMakeFiles/request.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/request.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/request.dir/build: librequest.a

.PHONY : CMakeFiles/request.dir/build

CMakeFiles/request.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/request.dir/cmake_clean.cmake
.PHONY : CMakeFiles/request.dir/clean

CMakeFiles/request.dir/depend: request.pb.h
CMakeFiles/request.dir/depend: request.pb.cc
	cd /opt/blockchain && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/blockchain /opt/blockchain /opt/blockchain /opt/blockchain /opt/blockchain/CMakeFiles/request.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/request.dir/depend

