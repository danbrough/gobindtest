# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp

# Include any dependencies generated for this target.
include CMakeFiles/kipfs.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/kipfs.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/kipfs.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/kipfs.dir/flags.make

CMakeFiles/kipfs.dir/jni.cpp.o: CMakeFiles/kipfs.dir/flags.make
CMakeFiles/kipfs.dir/jni.cpp.o: jni.cpp
CMakeFiles/kipfs.dir/jni.cpp.o: CMakeFiles/kipfs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/kipfs.dir/jni.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/kipfs.dir/jni.cpp.o -MF CMakeFiles/kipfs.dir/jni.cpp.o.d -o CMakeFiles/kipfs.dir/jni.cpp.o -c /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/jni.cpp

CMakeFiles/kipfs.dir/jni.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kipfs.dir/jni.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/jni.cpp > CMakeFiles/kipfs.dir/jni.cpp.i

CMakeFiles/kipfs.dir/jni.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kipfs.dir/jni.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/jni.cpp -o CMakeFiles/kipfs.dir/jni.cpp.s

CMakeFiles/kipfs.dir/hello.c.o: CMakeFiles/kipfs.dir/flags.make
CMakeFiles/kipfs.dir/hello.c.o: hello.c
CMakeFiles/kipfs.dir/hello.c.o: CMakeFiles/kipfs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/kipfs.dir/hello.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/kipfs.dir/hello.c.o -MF CMakeFiles/kipfs.dir/hello.c.o.d -o CMakeFiles/kipfs.dir/hello.c.o -c /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/hello.c

CMakeFiles/kipfs.dir/hello.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/kipfs.dir/hello.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/hello.c > CMakeFiles/kipfs.dir/hello.c.i

CMakeFiles/kipfs.dir/hello.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/kipfs.dir/hello.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/hello.c -o CMakeFiles/kipfs.dir/hello.c.s

# Object files for target kipfs
kipfs_OBJECTS = \
"CMakeFiles/kipfs.dir/jni.cpp.o" \
"CMakeFiles/kipfs.dir/hello.c.o"

# External object files for target kipfs
kipfs_EXTERNAL_OBJECTS =

libkipfs.so: CMakeFiles/kipfs.dir/jni.cpp.o
libkipfs.so: CMakeFiles/kipfs.dir/hello.c.o
libkipfs.so: CMakeFiles/kipfs.dir/build.make
libkipfs.so: CMakeFiles/kipfs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library libkipfs.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kipfs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/kipfs.dir/build: libkipfs.so
.PHONY : CMakeFiles/kipfs.dir/build

CMakeFiles/kipfs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/kipfs.dir/cmake_clean.cmake
.PHONY : CMakeFiles/kipfs.dir/clean

CMakeFiles/kipfs.dir/depend:
	cd /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp /home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/src/main/cpp/CMakeFiles/kipfs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/kipfs.dir/depend

