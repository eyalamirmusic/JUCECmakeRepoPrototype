include(FetchContent QUIET)

#helper function to grab any repo from git:
macro (update_from_git name repo branch)
    FetchContent_Declare(${name}
            GIT_REPOSITORY ${repo}
            GIT_SHALLOW TRUE
            GIT_PROGRESS TRUE
            GIT_TAG "origin/${branch}")

    FetchContent_GetProperties(${name})

    if (NOT ${name}_POPULATED)
        message("Updating ${name} from git...")
        FetchContent_Populate(${name})
        message("${name} update finished")
    endif ()
endmacro()

#removes MSVC warning: D9025
if(MSVC)
   string(REGEX REPLACE "/W3" "" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS})
   string(REGEX REPLACE "-W3" "" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS})
endif()

#Minimum MacOS target
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.9" CACHE STRING "Minimum OS X deployment version" FORCE)

#static linking in Windows:
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")












