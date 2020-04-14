cmake_minimum_required(VERSION 3.4)

find_package(Git QUIET REQUIRED)
project(JUCECMakeRepo)

#updating sobmodules. You can also grab JUCE in any other way
execute_process(COMMAND ${GIT_EXECUTABLE} "submodule" "update" "--init"
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})

#Sets the JUCE path to a variable, to allow subdirectories to know about it
set (JUCE_PATH ${CMAKE_CURRENT_LIST_DIR}/SDKs/JUCE)

#Adding JUCE subdirectory
add_subdirectory(${JUCE_PATH})

#adding any custom modules you might have:
add_subdirectory(Modules)

#adding project folders:
add_subdirectory(Apps)
add_subdirectory(Plugins)

#JUCE Extra: including tools like the projucer, audio plugin host, etc
#you probably not need those in a real project
add_subdirectory(JUCE_Extras)

#Builds examples (Just the demo runner by default)
#you probably not need those in real projects.
add_subdirectory(JUCE_Examples)