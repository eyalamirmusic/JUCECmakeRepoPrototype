cmake_minimum_required(VERSION 3.4)

include(GitHelpers)

function(update_frut)
    set(frutGit "https://github.com/McMartin/FRUT.git")
    update_git(${frutGit} "FRUT")
endfunction()

