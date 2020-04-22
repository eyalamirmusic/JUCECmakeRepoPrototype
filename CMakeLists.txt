cmake_minimum_required(VERSION 3.12)
project(JUCECMakeRepo)

#Updates or clones JUCE from git, and configures it for subdirectories:
include (CMake/FindJUCE-GIT.cmake)

#adding any custom modules you might have:
add_subdirectory(Modules)

#adding project folders:
add_subdirectory(Apps)
add_subdirectory(Plugins)

#JUCE Extra: including tools like Audio Plugin Host, etc
#This is a helpful class in case you need a JUCE tool as a part of your work process
add_subdirectory(JUCE_Extras)

