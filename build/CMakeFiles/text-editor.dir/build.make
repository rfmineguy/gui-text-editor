# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

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
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/rileyfischer/Documents/dev/text-editor

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/rileyfischer/Documents/dev/text-editor/build

# Include any dependencies generated for this target.
include CMakeFiles/text-editor.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/text-editor.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/text-editor.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/text-editor.dir/flags.make

CMakeFiles/text-editor.dir/codegen:
.PHONY : CMakeFiles/text-editor.dir/codegen

CMakeFiles/text-editor.dir/src/macos/main.m.o: CMakeFiles/text-editor.dir/flags.make
CMakeFiles/text-editor.dir/src/macos/main.m.o: /Users/rileyfischer/Documents/dev/text-editor/src/macos/main.m
CMakeFiles/text-editor.dir/src/macos/main.m.o: CMakeFiles/text-editor.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/rileyfischer/Documents/dev/text-editor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building OBJC object CMakeFiles/text-editor.dir/src/macos/main.m.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) -x objective-c $(OBJC_FLAGS) -MD -MT CMakeFiles/text-editor.dir/src/macos/main.m.o -MF CMakeFiles/text-editor.dir/src/macos/main.m.o.d -o CMakeFiles/text-editor.dir/src/macos/main.m.o -c /Users/rileyfischer/Documents/dev/text-editor/src/macos/main.m

CMakeFiles/text-editor.dir/src/macos/main.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing OBJC source to CMakeFiles/text-editor.dir/src/macos/main.m.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) $(OBJC_FLAGS) -E /Users/rileyfischer/Documents/dev/text-editor/src/macos/main.m > CMakeFiles/text-editor.dir/src/macos/main.m.i

CMakeFiles/text-editor.dir/src/macos/main.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling OBJC source to assembly CMakeFiles/text-editor.dir/src/macos/main.m.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) $(OBJC_FLAGS) -S /Users/rileyfischer/Documents/dev/text-editor/src/macos/main.m -o CMakeFiles/text-editor.dir/src/macos/main.m.s

CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.o: CMakeFiles/text-editor.dir/flags.make
CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.o: /Users/rileyfischer/Documents/dev/text-editor/src/macos/AppDelegate.m
CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.o: CMakeFiles/text-editor.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/rileyfischer/Documents/dev/text-editor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building OBJC object CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) -x objective-c $(OBJC_FLAGS) -MD -MT CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.o -MF CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.o.d -o CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.o -c /Users/rileyfischer/Documents/dev/text-editor/src/macos/AppDelegate.m

CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing OBJC source to CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) $(OBJC_FLAGS) -E /Users/rileyfischer/Documents/dev/text-editor/src/macos/AppDelegate.m > CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.i

CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling OBJC source to assembly CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) $(OBJC_FLAGS) -S /Users/rileyfischer/Documents/dev/text-editor/src/macos/AppDelegate.m -o CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.s

CMakeFiles/text-editor.dir/src/macos/MetalView.m.o: CMakeFiles/text-editor.dir/flags.make
CMakeFiles/text-editor.dir/src/macos/MetalView.m.o: /Users/rileyfischer/Documents/dev/text-editor/src/macos/MetalView.m
CMakeFiles/text-editor.dir/src/macos/MetalView.m.o: CMakeFiles/text-editor.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/rileyfischer/Documents/dev/text-editor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building OBJC object CMakeFiles/text-editor.dir/src/macos/MetalView.m.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) -x objective-c $(OBJC_FLAGS) -MD -MT CMakeFiles/text-editor.dir/src/macos/MetalView.m.o -MF CMakeFiles/text-editor.dir/src/macos/MetalView.m.o.d -o CMakeFiles/text-editor.dir/src/macos/MetalView.m.o -c /Users/rileyfischer/Documents/dev/text-editor/src/macos/MetalView.m

CMakeFiles/text-editor.dir/src/macos/MetalView.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing OBJC source to CMakeFiles/text-editor.dir/src/macos/MetalView.m.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) $(OBJC_FLAGS) -E /Users/rileyfischer/Documents/dev/text-editor/src/macos/MetalView.m > CMakeFiles/text-editor.dir/src/macos/MetalView.m.i

CMakeFiles/text-editor.dir/src/macos/MetalView.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling OBJC source to assembly CMakeFiles/text-editor.dir/src/macos/MetalView.m.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) $(OBJC_FLAGS) -S /Users/rileyfischer/Documents/dev/text-editor/src/macos/MetalView.m -o CMakeFiles/text-editor.dir/src/macos/MetalView.m.s

CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.o: CMakeFiles/text-editor.dir/flags.make
CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.o: /Users/rileyfischer/Documents/dev/text-editor/src/macos/MetalRenderer.m
CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.o: CMakeFiles/text-editor.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/rileyfischer/Documents/dev/text-editor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building OBJC object CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) -x objective-c $(OBJC_FLAGS) -MD -MT CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.o -MF CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.o.d -o CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.o -c /Users/rileyfischer/Documents/dev/text-editor/src/macos/MetalRenderer.m

CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing OBJC source to CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) $(OBJC_FLAGS) -E /Users/rileyfischer/Documents/dev/text-editor/src/macos/MetalRenderer.m > CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.i

CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling OBJC source to assembly CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang $(OBJC_DEFINES) $(OBJC_INCLUDES) $(OBJC_FLAGS) -S /Users/rileyfischer/Documents/dev/text-editor/src/macos/MetalRenderer.m -o CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.s

# Object files for target text-editor
text__editor_OBJECTS = \
"CMakeFiles/text-editor.dir/src/macos/main.m.o" \
"CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.o" \
"CMakeFiles/text-editor.dir/src/macos/MetalView.m.o" \
"CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.o"

# External object files for target text-editor
text__editor_EXTERNAL_OBJECTS =

text-editor: CMakeFiles/text-editor.dir/src/macos/main.m.o
text-editor: CMakeFiles/text-editor.dir/src/macos/AppDelegate.m.o
text-editor: CMakeFiles/text-editor.dir/src/macos/MetalView.m.o
text-editor: CMakeFiles/text-editor.dir/src/macos/MetalRenderer.m.o
text-editor: CMakeFiles/text-editor.dir/build.make
text-editor: CMakeFiles/text-editor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/rileyfischer/Documents/dev/text-editor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking OBJC executable text-editor"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/text-editor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/text-editor.dir/build: text-editor
.PHONY : CMakeFiles/text-editor.dir/build

CMakeFiles/text-editor.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/text-editor.dir/cmake_clean.cmake
.PHONY : CMakeFiles/text-editor.dir/clean

CMakeFiles/text-editor.dir/depend:
	cd /Users/rileyfischer/Documents/dev/text-editor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/rileyfischer/Documents/dev/text-editor /Users/rileyfischer/Documents/dev/text-editor /Users/rileyfischer/Documents/dev/text-editor/build /Users/rileyfischer/Documents/dev/text-editor/build /Users/rileyfischer/Documents/dev/text-editor/build/CMakeFiles/text-editor.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/text-editor.dir/depend

