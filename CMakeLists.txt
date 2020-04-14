cmake_minimum_required(VERSION 3.4)

project(JUCECMakeRepo)

execute_process(COMMAND
        "git"
        "submodule" "update" "--init"
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})

add_subdirectory(SDKs/JUCE)
add_subdirectory(Apps)
