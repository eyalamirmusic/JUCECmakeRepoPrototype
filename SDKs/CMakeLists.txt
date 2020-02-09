cmake_minimum_required(VERSION 3.4)

project(FRUTBuilder)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/CMake")

include(JUCEHelpers)
include(FrutHelpers)

update_frut()
update_juce()

message ("${projucerExeFile}")


