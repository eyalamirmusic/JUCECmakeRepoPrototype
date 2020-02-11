cmake_minimum_required(VERSION 3.15)

macro(sub_dir_list result curdir)
    FILE(GLOB children RELATIVE ${curdir} ${curdir}/*)
    SET(dirlist "")

    foreach(child ${children})
        if(IS_DIRECTORY ${curdir}/${child})
            LIST(APPEND dirlist ${child})
        endif()
    endforeach()

    SET(${result} ${dirlist})
endmacro()

function (add_projects_from TargetDir)
    sub_dir_list(SUBDIRS ${TargetDir})
    foreach(subdir ${SUBDIRS})
        add_subdirectory(${subdir})
    endforeach()
endfunction()
