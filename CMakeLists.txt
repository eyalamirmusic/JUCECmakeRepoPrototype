cmake_minimum_required(VERSION 3.4)

project(JUCECMakeRepo)

set (globalSDKsFolder ${CMAKE_CURRENT_LIST_DIR}/SDKs)
list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/Cmake")

include(JUCEHelpers)
include(FrutHelpers)

update_juce("develop")
update_frut()

add_subdirectory(Plugins)
add_subdirectory(Apps)
