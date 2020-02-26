#include <JuceHeader.h>

#include "Cmake.h"
#include "Git.h"

//Simple executable meant to regenerate IDE projects from the top CMakeLists.txt file

int main()
{
    auto gitFolder = getGitRoot();

    if (!gitFolder.isRoot())
        runCmake(initBuildFolder(gitFolder));
    else
        Logger::writeToLog("Can't find git root");

    return 0;
}
