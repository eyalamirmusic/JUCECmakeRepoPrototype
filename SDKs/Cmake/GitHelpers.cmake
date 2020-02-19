cmake_minimum_required(VERSION 3.4)

include(DirectoryHelpers)

function(post_build_copy target dest)
    add_custom_command(
            TARGET ${target}
            POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
            $<TARGET_FILE:${target}>
            ${dest})
endfunction()

function(git_clone repo repoFolder branch)
    execute_process(COMMAND "git" "clone" ${repo} ${repoFolder} "--recursive" "--branch" "${branch}"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
endfunction()

function(git_pull folder)
    execute_process(COMMAND "git" "pull"
            WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}/${folder}")
endfunction()

function(update_git gitRepo repoFolder branch)
    git_clone(${gitRepo} ${repoFolder} ${branch})
    git_pull(${repoFolder})
endfunction()

