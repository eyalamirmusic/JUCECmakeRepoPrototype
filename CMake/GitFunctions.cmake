include(FetchContent QUIET)

#Helper file to grab JUCE automatically from git.
#You can set this to use a specific commit, a git submodule, etc.

#helper function to grab any repo from git:
function (update_from_git name repo branch)
    FetchContent_Declare(${name}
            GIT_REPOSITORY ${repo}
            GIT_SHALLOW TRUE
            GIT_PROGRESS TRUE
            GIT_TAG "origin/${branch}")

    FetchContent_GetProperties(${name})

    if (NOT juce_POPULATED)
        message("Updating ${name} from git...")
        FetchContent_Populate(${name})
        message("${name} update finished")
    endif ()

    set(${name}_SOURCE_ROOT ${CMAKE_CURRENT_BINARY_DIR}/_deps/${name}-src CACHE INTERNAL "")
endfunction()

function(add_subdirectory_from_git name repo branch)
    update_from_git(${name} ${repo} ${branch})
    add_subdirectory(${${name}_SOURCE_ROOT})
endfunction()













