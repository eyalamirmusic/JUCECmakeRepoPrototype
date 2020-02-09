cmake_minimum_required(VERSION 3.4)

include(GitHelpers)

function(build_frut exeFile)
    set(frutDIR "${PROJECT_SOURCE_DIR}/FRUT")
    message(${frutDIR})

    execute_process(COMMAND "cmake" "." "-DJUCE_ROOT=${PROJECT_SOURCE_DIR}/JUCE" "--config Release"
            WORKING_DIRECTORY ${frutDIR})

#    execute_process(COMMAND "cmake" "." "--build" "--target" "Jucer2Reprojucer" "--config" "Release"
#            WORKING_DIRECTORY ${frutDIR})

#    set(${exeFile} "${projucerBuildDir}/build/Release/Projucer.app" PARENT_SCOPE)
endfunction()

macro(update_frut)
    set(frutGit "https://github.com/McMartin/FRUT.git")
    update_git(${frutGit} "FRUT ")
    build_frut(jucer2reprojucerEXE)
endmacro()

