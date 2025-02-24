cmake_minimum_required(VERSION 3.20)

project(text-editor LANGUAGES OBJC)

file(GLOB SHADERS "res/shaders/*.metal")
add_executable(text-editor 
	src/macos/main.m
	src/macos/AppDelegate.m
	src/macos/MetalView.m
	src/macos/MetalRenderer.m
	src/macos/MetalProfiler.m
	src/macos/UI.m
	src/macos/LinearAlg.m)
target_link_libraries(text-editor "-framework CoreFoundation")
target_link_libraries(text-editor "-framework Cocoa")
target_link_libraries(text-editor "-framework AppKit")
target_link_libraries(text-editor "-framework MetalKit")
target_link_libraries(text-editor "-framework Metal")

message("${CMAKE_SOURCE_DIR}")

set(METAL_FLAGS -frecord-sources -gline-tables-only -I${CMAKE_SOURCE_DIR}/src/macos/)
add_custom_command(
    OUTPUT default.metallib
    COMMAND xcrun -sdk macosx metal ${METAL_FLAGS} -o squircle.ir -c "${CMAKE_SOURCE_DIR}/res/shaders/squircle.metal"
    COMMAND xcrun -sdk macosx metal ${METAL_FLAGS} -o quad.ir -c "${CMAKE_SOURCE_DIR}/res/shaders/quad.metal"
    COMMAND xcrun -sdk macosx metallib -o default.metallib squircle.ir quad.ir
    DEPENDS ${SHADERS}
)

add_custom_target(compile_shaders ALL DEPENDS default.metallib)
add_dependencies(text-editor compile_shaders)
