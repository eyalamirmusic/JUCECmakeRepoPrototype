include(FetchContent QUIET)

#Helper file to grab JUCE automatically from git.
#You can set this to use a specific commit, a git submodule, etc.

macro(update_juce_from_git)
    # If JUCE is a submodule you could use SOURCE_DIR here instead of the GIT_* args
    FetchContent_Declare(juce
            GIT_REPOSITORY "https://github.com/juce-framework/juce"
            GIT_SHALLOW TRUE
            GIT_PROGRESS TRUE
            GIT_TAG "origin/juce6")

    # Check whether we already set up JUCE during a previous configure
    FetchContent_GetProperties(juce)

    if (NOT juce_POPULATED)
        message("Updating JUCE from git...")
        # Clone repo if necessary, record that JUCE has been populated
        FetchContent_Populate(juce)

        message("JUCE update finished")
    endif ()
endmacro()

function(install_juce_from_build_tree)
    # Configure JUCE
    execute_process(COMMAND "${CMAKE_COMMAND}" -S "${juce_SOURCE_DIR}" -B "${juce_BINARY_DIR}")

    # Build JUCE
    execute_process(COMMAND "${CMAKE_COMMAND}" --build "${juce_BINARY_DIR}")

    include("${juce_BINARY_DIR}/JUCEExportConfig.cmake")
endfunction()


update_juce_from_git()
install_juce_from_build_tree()

#useful to build stuff like the projucer, audio plugin host, etc in your own project
set(JUCE_SOURCE_ROOT ${CMAKE_CURRENT_BINARY_DIR}/_deps/juce-src)



