cmake_minimum_required(VERSION 3.4)

include(GitHelpers)
include(DefaultJUCEConfig)

set(frutHelpersDir "${CMAKE_CURRENT_LIST_DIR}" CACHE INTERNAL "")

function(configure_frut)
    execute_process(COMMAND
            "cmake"
            "."
            "-DJUCE_ROOT=../JUCE"
            "-DCMAKE_BUILD_TYPE=Release"

            WORKING_DIRECTORY ${frutDirectory})
endfunction()

function(build_reprojucer)
    execute_process(COMMAND
            "cmake"
            "--build"
            "."
            "--target" "Jucer2Reprojucer"
            "--config" "Release"
            WORKING_DIRECTORY ${frutDirectory})
endfunction()

function(get_reprojucer_exe reprojucerFile)

    set(frutDir "${CMAKE_SOURCE_DIR}/SDKs/FRUT")
    set(jucerBaseFolder "${frutDir}/Jucer2Reprojucer")

    if (APPLE)
        set(${reprojucerFile} "${jucerBaseFolder}/Jucer2Reprojucer" PARENT_SCOPE)
    else ()
        set(${reprojucerFile} "${jucerBaseFolder}/Release/ConsoleApp/Jucer2Reprojucer.exe" PARENT_SCOPE)
    endif ()

endfunction()

function(build_frut)
    configure_frut()
    build_reprojucer()
endfunction()

function(get_reprojuer_file result)

endfunction()


macro(update_frut)
    set(frutGit "https://github.com/McMartin/FRUT.git")
    set(frutDirectory "${globalSDKsFolder}/FRUT" CACHE INTERNAL "")

    update_git(${frutGit} ${frutDirectory} "master")
    build_frut()

    set (frutScriptPath ${frutDirectory}/cmake)
    list (APPEND CMAKE_MODULE_PATH ${frutScriptPath})
    include(Reprojucer)

endmacro()

function(create_cmake jucerFile jucerFilePath)

    set(frutCMake "${frutDirectory}/Reprojucer.cmake")

    set(jucerEXE "Before")
    get_reprojucer_exe(jucerEXE)

    execute_process(COMMAND
            ${jucerEXE}
            ${jucerFile}
            "--juce-modules" "${frutDirectory}/../JUCE/modules"
            WORKING_DIRECTORY ${jucerFilePath})
endfunction()

function(create_cmake_in_dir targetDir)
    file(GLOB files "${targetDir}/*.jucer")

    foreach (jucerFile ${files})
        create_cmake(${jucerFile} ${targetDir})
    endforeach ()
endfunction()

function(create_cmake_in_subdirs targetDir)
    sub_dir_list(subDirs ${targetDir})

    foreach (subDir ${subDirs})
        set(absoluteSubDir "${targetDir}/${subDir}")
        create_cmake_in_dir(${absoluteSubDir})
    endforeach ()
endfunction()
