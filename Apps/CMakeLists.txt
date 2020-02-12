cmake_minimum_required(VERSION 3.4)

project(Apps)

include(DirectoryHelpers)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../SDKs/FRUT/cmake")

create_cmake_in_subdirs(${CMAKE_CURRENT_SOURCE_DIR})
add_projects_from(${CMAKE_CURRENT_SOURCE_DIR})