cmake_minimum_required(VERSION 3.12)
project(JUCECMakeRepo)

#adding my own custom git functions, to save some boilerplate::
include (CMake/GitFunctions.cmake)

#calling my custom function to grab JUCE 6 from git:
update_from_git(JUCE "https://github.com/juce-framework/juce" juce6)

#adding juce as a subdirectory:
add_subdirectory(${JUCE_SOURCE_DIR})

#adding any custom modules you might have:
add_subdirectory(Modules)

#adding project folders:
add_subdirectory(Apps)
add_subdirectory(Plugins)

#JUCE Extra: including tools like Audio Plugin Host, etc
#This is a helpful subdirectory in case you need a JUCE tool as a part of your work process
add_subdirectory(JUCE_Extras)