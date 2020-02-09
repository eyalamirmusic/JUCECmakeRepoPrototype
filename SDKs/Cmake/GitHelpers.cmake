cmake_minimum_required(VERSION 3.4)

function (git_clone repo args)
    execute_process(COMMAND "git" "clone" ${repo} ${args}
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
endfunction()

function (git_pull folder)
    execute_process(COMMAND "git" "pull"
            WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}/${folder}")
endfunction()

function(update_git gitRepo repoFolder)
    git_clone(${gitRepo} ${repoFolder})
    git_pull(${repoFolder})
endfunction()