include(FetchContent)

# If JUCE is a submodule you could use SOURCE_DIR here instead of the GIT_* args
FetchContent_Declare(juce
        GIT_REPOSITORY "https://github.com/juce-framework/juce"
        GIT_SHALLOW TRUE
        GIT_PROGRESS TRUE
        GIT_TAG "origin/juce6")

# This is our local install dir for JUCE
set(JUCE_ROOT "${CMAKE_CURRENT_BINARY_DIR}/install")

# Check whether we already set up JUCE during a previous configure
FetchContent_GetProperties(juce)

if (NOT juce_POPULATED)
    # Clone repo if necessary, record that JUCE has been populated
    FetchContent_Populate(juce)

    # Configure JUCE
    execute_process(
            COMMAND "${CMAKE_COMMAND}"
            -S "${juce_SOURCE_DIR}"
            -B "${juce_BINARY_DIR}"
            "-DCMAKE_INSTALL_PREFIX=${JUCE_ROOT}")

    # Install JUCE locally to the build tree
    execute_process(
            COMMAND "${CMAKE_COMMAND}"
            --build "${juce_BINARY_DIR}"
            --target install)
endif ()

#useful to build stuff like the projucer, audio plugin host, etc in your own project
set (JUCE_SOURCE_ROOT ${CMAKE_CURRENT_BINARY_DIR}/_deps/juce-src)

#you can now add JUCE using add_subdirectory or find_package:

add_subdirectory(${JUCE_SOURCE_ROOT})

#find_package(JUCE CONFIG REQUIRED)