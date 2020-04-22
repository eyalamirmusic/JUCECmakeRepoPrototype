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

    FetchContent_GetProperties(juce)

    if (NOT juce_POPULATED)
        message("Updating JUCE from git...")
        FetchContent_Populate(juce)
        message("JUCE update finished")
    endif ()
endmacro()

update_juce_from_git()

#useful to build stuff like the projucer, audio plugin host, etc in your own project
set(JUCE_SOURCE_ROOT ${CMAKE_CURRENT_BINARY_DIR}/_deps/juce-src)
add_subdirectory(${JUCE_SOURCE_ROOT})








