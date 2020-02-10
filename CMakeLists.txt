cmake_minimum_required(VERSION 3.4)

project(JUCECMakeRepo)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/SDKs/CMake")

add_subdirectory(SDKs)
add_subdirectory(Plugins)

