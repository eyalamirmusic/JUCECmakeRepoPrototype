cmake_minimum_required(VERSION 3.12)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/CMake")
find_package(JUCE-GIT REQUIRED)

project(JUCECMakeRepo)

#adding any custom modules you might have:
add_subdirectory(Modules)

#adding project folders:
add_subdirectory(Apps)
add_subdirectory(Plugins)

#JUCE Extra: including tools like the projucer, audio plugin host, etc
#you probably don't need those in a real project
add_subdirectory(JUCE_Extras)

#Builds examples (Just the demo runner by default)
#you probably don't need those in real projects.
add_subdirectory(JUCE_Examples)