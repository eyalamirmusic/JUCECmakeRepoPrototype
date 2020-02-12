cmake_minimum_required(VERSION 3.4)

function (git_clone repo repoFolder branch)
    execute_process(COMMAND "git" "clone" ${repo} ${repoFolder} "--branch" "${branch}"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
endfunction()

function (git_pull folder)
    execute_process(COMMAND "git" "pull"
            WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}/${folder}")
endfunction()

function(update_git gitRepo repoFolder branch)
    git_clone(${gitRepo} ${repoFolder} ${branch})
    git_pull(${repoFolder})
endfunction()