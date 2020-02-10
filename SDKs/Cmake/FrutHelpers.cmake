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

function(build_frut exeFile frutDir)
    configure_frut(${frutDir})
    build_reprojucer(${frutDir})

    if (APPLE)
        set(reprojucerFile "${frutDir}/Jucer2Reprojucer/Jucer2Reprojucer")
    else ()
        message("Remember to set up the build for non-apple systems")
    endif ()

    set(${exeFile} ${reprojucerFile} PARENT_SCOPE)
endfunction()

function (get_reprojuer_file result)

endfunction()

macro(update_frut)
    set(frutGit "https://github.com/McMartin/FRUT.git")
    set(frutDir "${PROJECT_SOURCE_DIR}/FRUT")

    update_git(${frutGit} "FRUT")
    build_frut(jucer2reprojucerEXE ${frutDir})
endmacro()

macro(create_cmake jucerFile jucerFilePath)
    set(frutCMake "${frutDir}/Reprojucer.cmake")
    set(frutDir "${PROJECT_SOURCE_DIR}/FRUT")

    message (${jucerFilePath})
    message (${jucerFile})

    execute_process(COMMAND
            ${jucer2reprojucerEXE}
            ${jucerFile}
            ${frutCMake}
            WORKING_DIRECTORY ${frutDir})

#    add_subdirectory(${jucerFilePath})
endmacro()

function (create_cmake_in_dir targetDir)
    file(GLOB files "${targetDir}/*.jucer")

    foreach(jucerFile ${files})
        create_cmake(${jucerFile}, ${targetDir})
    endforeach()

#    FOREACH(jucer ${targetJUCER})
#        create_cmake(${jucer}, ${targetDir})
#    ENDFOREACH()

endfunction()

function (create_cmake_in_subdirs targetDir)
    SUBDIRLIST(SUBDIRS ${targetDir})

    FOREACH(subDir ${SUBDIRS})
        set (absoluteSubDir "${targetDir}/${subDir}")
        create_cmake_in_dir(${absoluteSubDir})
    ENDFOREACH()
endfunction()
