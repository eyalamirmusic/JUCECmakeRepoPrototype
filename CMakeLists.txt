cmake_minimum_required (VERSION 3.15)
project(JUCECMakeRepo VERSION 0.0.1)

find_package(Git QUIET REQUIRED)

# Update submodules (you can also grab JUCE in any other way)
execute_process(COMMAND ${GIT_EXECUTABLE} "submodule" "update" "--init"
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})

# Add JUCE subdirectory
option(JUCE_BUILD_EXTRAS "Add build targets for the Projucer and other tools" ON)
option(JUCE_BUILD_EXAMPLES "Add build targets for the DemoRunner and PIPs" ON)
add_subdirectory(SDKs/JUCE)

# Add custom modules
add_subdirectory(Modules)

# Add project folders
add_subdirectory(Apps)
add_subdirectory(Plugins)
