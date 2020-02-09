cmake_minimum_required(VERSION 3.4)

project(FRUTBuilder)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/CMake")
include(GitHelpers)

set (frutGit "https://github.com/McMartin/FRUT.git")

update_git(${frutGit} "FRUT")

