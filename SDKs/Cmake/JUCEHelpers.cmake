cmake_minimum_required(VERSION 3.4)

include(GitHelpers)

function(build_projucer_func projucerEXE)
    set(projucerDir "${PROJECT_SOURCE_DIR}/JUCE/extras/Projucer/Builds")

    if (APPLE)
        set(projucerBuildDir "${projucerDir}/MacOSX")

        execute_process(COMMAND "xcodebuild" "-configuration" "Release"
                WORKING_DIRECTORY ${projucerBuildDir})

        set(${projucerEXE} "${projucerBuildDir}/build/Release/Projucer.app" PARENT_SCOPE)
    else ()
        set(projucerBuildDir "${projucerDir}/VisualStudio2019")
        message("Remember to set up the build for non-apple systems")
    endif ()
endfunction()

macro(update_juce branch)
    set(juceGit "https://github.com/WeAreROLI/JUCE.git")
    update_git(${juceGit} "JUCE" ${branch})

    if (alwaysBuildProjucer)
        build_projucer_func(projucerEXE)
    endif()

    set(JUCE_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/JUCE")
endmacro()

