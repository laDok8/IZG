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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zen/Documents/izg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zen/Documents/izg/build

# Include any dependencies generated for this target.
include TxtUtils/CMakeFiles/TxtUtils.dir/depend.make

# Include the progress variables for this target.
include TxtUtils/CMakeFiles/TxtUtils.dir/progress.make

# Include the compile flags for this target's objects.
include TxtUtils/CMakeFiles/TxtUtils.dir/flags.make

TxtUtils/CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.o: TxtUtils/CMakeFiles/TxtUtils.dir/flags.make
TxtUtils/CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.o: ../TxtUtils/src/TxtUtils/TxtUtils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zen/Documents/izg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object TxtUtils/CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.o"
	cd /home/zen/Documents/izg/build/TxtUtils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.o -c /home/zen/Documents/izg/TxtUtils/src/TxtUtils/TxtUtils.cpp

TxtUtils/CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.i"
	cd /home/zen/Documents/izg/build/TxtUtils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zen/Documents/izg/TxtUtils/src/TxtUtils/TxtUtils.cpp > CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.i

TxtUtils/CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.s"
	cd /home/zen/Documents/izg/build/TxtUtils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zen/Documents/izg/TxtUtils/src/TxtUtils/TxtUtils.cpp -o CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.s

# Object files for target TxtUtils
TxtUtils_OBJECTS = \
"CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.o"

# External object files for target TxtUtils
TxtUtils_EXTERNAL_OBJECTS =

TxtUtils/libTxtUtils.a: TxtUtils/CMakeFiles/TxtUtils.dir/src/TxtUtils/TxtUtils.cpp.o
TxtUtils/libTxtUtils.a: TxtUtils/CMakeFiles/TxtUtils.dir/build.make
TxtUtils/libTxtUtils.a: TxtUtils/CMakeFiles/TxtUtils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zen/Documents/izg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libTxtUtils.a"
	cd /home/zen/Documents/izg/build/TxtUtils && $(CMAKE_COMMAND) -P CMakeFiles/TxtUtils.dir/cmake_clean_target.cmake
	cd /home/zen/Documents/izg/build/TxtUtils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TxtUtils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
TxtUtils/CMakeFiles/TxtUtils.dir/build: TxtUtils/libTxtUtils.a

.PHONY : TxtUtils/CMakeFiles/TxtUtils.dir/build

TxtUtils/CMakeFiles/TxtUtils.dir/clean:
	cd /home/zen/Documents/izg/build/TxtUtils && $(CMAKE_COMMAND) -P CMakeFiles/TxtUtils.dir/cmake_clean.cmake
.PHONY : TxtUtils/CMakeFiles/TxtUtils.dir/clean

TxtUtils/CMakeFiles/TxtUtils.dir/depend:
	cd /home/zen/Documents/izg/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zen/Documents/izg /home/zen/Documents/izg/TxtUtils /home/zen/Documents/izg/build /home/zen/Documents/izg/build/TxtUtils /home/zen/Documents/izg/build/TxtUtils/CMakeFiles/TxtUtils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : TxtUtils/CMakeFiles/TxtUtils.dir/depend
