cmake_minimum_required(VERSION 3.4)

project(JUCECMakeRepo)

#updating sobmodules. You can also grab JUCE in any other way
execute_process(COMMAND "git" "submodule" "update" "--init"
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})

#Adding JUCE subdirectory
add_subdirectory(SDKs/JUCE)

#adding any custom modules you might have:
add_subdirectory(Modules)

#adding project folders:
add_subdirectory(Apps)
add_subdirectory(Plugins)

#JUCE Extra: including tools like the projucer, audio plugin host, etc
add_subdirectory(JUCE_Extras)
