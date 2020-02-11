cmake_minimum_required(VERSION 3.15)

macro(sub_dir_list result curdir)
    file(GLOB children RELATIVE ${curdir} ${curdir}/*)
    set(dirlist "")

    foreach(child ${children})
        if(IS_DIRECTORY ${curdir}/${child})
            list(APPEND dirlist ${child})
        endif()
    endforeach()

    SET(${result} ${dirlist})
endmacro()

function (add_projects_from TargetDir)
    sub_dir_list(subDirs ${TargetDir})
    foreach(subdir ${subDirs})
        add_subdirectory(${subdir})
    endforeach()
endfunction()
