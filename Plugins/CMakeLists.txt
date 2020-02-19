cmake_minimum_required(VERSION 3.4)

project(Plugins)

create_cmake_in_subdirs(${CMAKE_CURRENT_SOURCE_DIR})
add_projects_from(${CMAKE_CURRENT_SOURCE_DIR})