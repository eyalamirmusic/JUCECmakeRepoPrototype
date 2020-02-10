cmake_minimum_required(VERSION 3.4)

include(GitHelpers)

function(configure_frut frutDirectory)
    execute_process(COMMAND
            "-DCMAKE_BUILD_TYPE=Release"
            "cmake"
            "."
            "-DJUCE_ROOT=../JUCE"

            WORKING_DIRECTORY ${frutDirectory})
endfunction()

function(build_reprojucer frutDirectory)
    execute_process(COMMAND
            "cmake"
            "--build"
            "."
            "--target" "Jucer2Reprojucer"
            "--config" "Release"

            WORKING_DIRECTORY ${frutDirectory})
endfunction()

function(build_frut exeFile)
    set(frutDir "${PROJECT_SOURCE_DIR}/FRUT")

    configure_frut(${frutDir})
    build_reprojucer(${frutDir})

    if (APPLE)
        set(reprojucerFile "${frutDir}/Jucer2Reprojucer/Jucer2Reprojucer")
    else()
        message("Remember to set up the build for non-apple systems")
    endif ()

    set(${exeFile} ${reprojucerFile} PARENT_SCOPE)
endfunction()

macro(update_frut)
    set(frutGit "https://github.com/McMartin/FRUT.git")
    update_git(${frutGit} "FRUT")
    build_frut(jucer2reprojucerEXE)
endmacro()

function(create_cmake jucerFile)

endfunction()