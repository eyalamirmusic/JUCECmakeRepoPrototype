cmake_minimum_required(VERSION 3.12)
project(JUCE_Extras VERSION 1.0)

set (JUCE_PATH ${CMAKE_CURRENT_LIST_DIR}/../SDKs/JUCE)

add_subdirectory(${JUCE_PATH}/extras ${CMAKE_CURRENT_BINARY_DIR}/Extras)