# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/pi/Desktop/final/NoPenNoGain/main/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Desktop/final/NoPenNoGain/main/src

# Include any dependencies generated for this target.
include CMakeFiles/trackCam.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/trackCam.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/trackCam.dir/flags.make

CMakeFiles/trackCam.dir/main/main.cpp.o: CMakeFiles/trackCam.dir/flags.make
CMakeFiles/trackCam.dir/main/main.cpp.o: main/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/final/NoPenNoGain/main/src/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/trackCam.dir/main/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/trackCam.dir/main/main.cpp.o -c /home/pi/Desktop/final/NoPenNoGain/main/src/main/main.cpp

CMakeFiles/trackCam.dir/main/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/trackCam.dir/main/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Desktop/final/NoPenNoGain/main/src/main/main.cpp > CMakeFiles/trackCam.dir/main/main.cpp.i

CMakeFiles/trackCam.dir/main/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/trackCam.dir/main/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Desktop/final/NoPenNoGain/main/src/main/main.cpp -o CMakeFiles/trackCam.dir/main/main.cpp.s

CMakeFiles/trackCam.dir/main/main.cpp.o.requires:

.PHONY : CMakeFiles/trackCam.dir/main/main.cpp.o.requires

CMakeFiles/trackCam.dir/main/main.cpp.o.provides: CMakeFiles/trackCam.dir/main/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/trackCam.dir/build.make CMakeFiles/trackCam.dir/main/main.cpp.o.provides.build
.PHONY : CMakeFiles/trackCam.dir/main/main.cpp.o.provides

CMakeFiles/trackCam.dir/main/main.cpp.o.provides.build: CMakeFiles/trackCam.dir/main/main.cpp.o


CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o: CMakeFiles/trackCam.dir/flags.make
CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o: main/trackCam_boost.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/final/NoPenNoGain/main/src/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o -c /home/pi/Desktop/final/NoPenNoGain/main/src/main/trackCam_boost.cpp

CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Desktop/final/NoPenNoGain/main/src/main/trackCam_boost.cpp > CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.i

CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Desktop/final/NoPenNoGain/main/src/main/trackCam_boost.cpp -o CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.s

CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o.requires:

.PHONY : CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o.requires

CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o.provides: CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o.requires
	$(MAKE) -f CMakeFiles/trackCam.dir/build.make CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o.provides.build
.PHONY : CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o.provides

CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o.provides.build: CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o


# Object files for target trackCam
trackCam_OBJECTS = \
"CMakeFiles/trackCam.dir/main/main.cpp.o" \
"CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o"

# External object files for target trackCam
trackCam_EXTERNAL_OBJECTS =

trackCam: CMakeFiles/trackCam.dir/main/main.cpp.o
trackCam: CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o
trackCam: CMakeFiles/trackCam.dir/build.make
trackCam: /opt/vc/lib/libmmal_core.so
trackCam: /opt/vc/lib/libmmal_util.so
trackCam: /opt/vc/lib/libmmal.so
trackCam: /opt/vc/lib/libmmal_core.so
trackCam: /opt/vc/lib/libmmal_util.so
trackCam: /opt/vc/lib/libmmal.so
trackCam: /usr/local/lib/libopencv_dnn.so.3.3.1
trackCam: /usr/local/lib/libopencv_ml.so.3.3.1
trackCam: /usr/local/lib/libopencv_objdetect.so.3.3.1
trackCam: /usr/local/lib/libopencv_shape.so.3.3.1
trackCam: /usr/local/lib/libopencv_stitching.so.3.3.1
trackCam: /usr/local/lib/libopencv_superres.so.3.3.1
trackCam: /usr/local/lib/libopencv_videostab.so.3.3.1
trackCam: /usr/local/lib/libopencv_calib3d.so.3.3.1
trackCam: /usr/local/lib/libopencv_features2d.so.3.3.1
trackCam: /usr/local/lib/libopencv_flann.so.3.3.1
trackCam: /usr/local/lib/libopencv_highgui.so.3.3.1
trackCam: /usr/local/lib/libopencv_photo.so.3.3.1
trackCam: /usr/local/lib/libopencv_video.so.3.3.1
trackCam: /usr/local/lib/libopencv_videoio.so.3.3.1
trackCam: /usr/local/lib/libopencv_imgcodecs.so.3.3.1
trackCam: /usr/local/lib/libopencv_imgproc.so.3.3.1
trackCam: /usr/local/lib/libopencv_core.so.3.3.1
trackCam: CMakeFiles/trackCam.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Desktop/final/NoPenNoGain/main/src/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable trackCam"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/trackCam.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/trackCam.dir/build: trackCam

.PHONY : CMakeFiles/trackCam.dir/build

CMakeFiles/trackCam.dir/requires: CMakeFiles/trackCam.dir/main/main.cpp.o.requires
CMakeFiles/trackCam.dir/requires: CMakeFiles/trackCam.dir/main/trackCam_boost.cpp.o.requires

.PHONY : CMakeFiles/trackCam.dir/requires

CMakeFiles/trackCam.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/trackCam.dir/cmake_clean.cmake
.PHONY : CMakeFiles/trackCam.dir/clean

CMakeFiles/trackCam.dir/depend:
	cd /home/pi/Desktop/final/NoPenNoGain/main/src && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Desktop/final/NoPenNoGain/main/src /home/pi/Desktop/final/NoPenNoGain/main/src /home/pi/Desktop/final/NoPenNoGain/main/src /home/pi/Desktop/final/NoPenNoGain/main/src /home/pi/Desktop/final/NoPenNoGain/main/src/CMakeFiles/trackCam.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/trackCam.dir/depend

