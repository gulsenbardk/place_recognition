# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /home/gulsen/.local/lib/python3.8/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/gulsen/.local/lib/python3.8/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gulsen/Feb24/bow

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gulsen/Feb24/bow/build

# Include any dependencies generated for this target.
include CMakeFiles/image_browser.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/image_browser.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/image_browser.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/image_browser.dir/flags.make

CMakeFiles/image_browser.dir/src/html_writer.cpp.o: CMakeFiles/image_browser.dir/flags.make
CMakeFiles/image_browser.dir/src/html_writer.cpp.o: /home/gulsen/Feb24/bow/src/html_writer.cpp
CMakeFiles/image_browser.dir/src/html_writer.cpp.o: CMakeFiles/image_browser.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gulsen/Feb24/bow/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/image_browser.dir/src/html_writer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/image_browser.dir/src/html_writer.cpp.o -MF CMakeFiles/image_browser.dir/src/html_writer.cpp.o.d -o CMakeFiles/image_browser.dir/src/html_writer.cpp.o -c /home/gulsen/Feb24/bow/src/html_writer.cpp

CMakeFiles/image_browser.dir/src/html_writer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_browser.dir/src/html_writer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gulsen/Feb24/bow/src/html_writer.cpp > CMakeFiles/image_browser.dir/src/html_writer.cpp.i

CMakeFiles/image_browser.dir/src/html_writer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_browser.dir/src/html_writer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gulsen/Feb24/bow/src/html_writer.cpp -o CMakeFiles/image_browser.dir/src/html_writer.cpp.s

CMakeFiles/image_browser.dir/src/image_browser.cpp.o: CMakeFiles/image_browser.dir/flags.make
CMakeFiles/image_browser.dir/src/image_browser.cpp.o: /home/gulsen/Feb24/bow/src/image_browser.cpp
CMakeFiles/image_browser.dir/src/image_browser.cpp.o: CMakeFiles/image_browser.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gulsen/Feb24/bow/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/image_browser.dir/src/image_browser.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/image_browser.dir/src/image_browser.cpp.o -MF CMakeFiles/image_browser.dir/src/image_browser.cpp.o.d -o CMakeFiles/image_browser.dir/src/image_browser.cpp.o -c /home/gulsen/Feb24/bow/src/image_browser.cpp

CMakeFiles/image_browser.dir/src/image_browser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_browser.dir/src/image_browser.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gulsen/Feb24/bow/src/image_browser.cpp > CMakeFiles/image_browser.dir/src/image_browser.cpp.i

CMakeFiles/image_browser.dir/src/image_browser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_browser.dir/src/image_browser.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gulsen/Feb24/bow/src/image_browser.cpp -o CMakeFiles/image_browser.dir/src/image_browser.cpp.s

# Object files for target image_browser
image_browser_OBJECTS = \
"CMakeFiles/image_browser.dir/src/html_writer.cpp.o" \
"CMakeFiles/image_browser.dir/src/image_browser.cpp.o"

# External object files for target image_browser
image_browser_EXTERNAL_OBJECTS =

libimage_browser.a: CMakeFiles/image_browser.dir/src/html_writer.cpp.o
libimage_browser.a: CMakeFiles/image_browser.dir/src/image_browser.cpp.o
libimage_browser.a: CMakeFiles/image_browser.dir/build.make
libimage_browser.a: CMakeFiles/image_browser.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gulsen/Feb24/bow/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libimage_browser.a"
	$(CMAKE_COMMAND) -P CMakeFiles/image_browser.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/image_browser.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/image_browser.dir/build: libimage_browser.a
.PHONY : CMakeFiles/image_browser.dir/build

CMakeFiles/image_browser.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/image_browser.dir/cmake_clean.cmake
.PHONY : CMakeFiles/image_browser.dir/clean

CMakeFiles/image_browser.dir/depend:
	cd /home/gulsen/Feb24/bow/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gulsen/Feb24/bow /home/gulsen/Feb24/bow /home/gulsen/Feb24/bow/build /home/gulsen/Feb24/bow/build /home/gulsen/Feb24/bow/build/CMakeFiles/image_browser.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/image_browser.dir/depend
