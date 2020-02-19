cmake_minimum_required(VERSION 3.11)

project(SDKs)

set (scriptsFolder "${CMAKE_CURRENT_SOURCE_DIR}/CMake")
list(APPEND CMAKE_MODULE_PATH ${scriptsFolder})
list(APPEND CMAKE_MODULE_PATH "${scriptsFolder}/FindJUCE")

set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} CACHE INTERNAL "")

set (juceRootDir "${CMAKE_CURRENT_SOURCE_DIR}/JUCE" CACHE INTERNAL "")
set (juceModulesDir "${juceRootDir}/modules" CACHE INTERNAL "")

include(JUCEHelpers)
include(FrutHelpers)

update_juce("develop")
update_frut()