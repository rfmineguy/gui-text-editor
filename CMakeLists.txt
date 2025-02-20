cmake_minimum_required(VERSION 3.20)

project(text-editor LANGUAGES OBJC)

add_executable(text-editor src/macos/main.m src/macos/AppDelegate.m)
target_link_libraries(text-editor "-framework CoreFoundation")
target_link_libraries(text-editor "-framework Cocoa")
target_link_libraries(text-editor "-framework AppKit")
target_link_libraries(text-editor "-framework MetalKit")
target_link_libraries(text-editor "-framework Metal")
