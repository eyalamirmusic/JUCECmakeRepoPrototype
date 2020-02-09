cmake_minimum_required(VERSION 3.4)

include(GitHelpers)

set (projucerExeFile "Before")

function(build_projucer)
    set (projucerDir "${PROJECT_SOURCE_DIR}/JUCE/extras/Projucer/Builds")

    if (APPLE)
        set(projucerBuildDir "${projucerDir}/MacOSX")

        execute_process(COMMAND "xcodebuild" "-configuration" "Release"
                WORKING_DIRECTORY ${projucerBuildDir})

        message ("${ProjucerExeFile}")
        set (projucerExeFile "${projucerBuildDir}/build/Release/Projucer.app")
        message ("${ProjucerExeFile}")
    else ()
        set(projucerBuildDir "${projucerDir}/VisualStudio2019")
        message("Remember to set up the build for non-apple systems")
    endif ()
endfunction()

function(update_juce)
    set(juceGit "https://github.com/WeAreROLI/JUCE.git")
    update_git(${juceGit} "JUCE")
    build_projucer()
endfunction()

