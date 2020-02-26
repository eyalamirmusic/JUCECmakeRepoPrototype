#include "Helpers.h"

bool isGitRoot(const File& directory)
{
    return directory.getChildFile(".git").exists();
}

File getGitRoot()
{
    auto currentDir = File::getSpecialLocation(File::currentExecutableFile);

    while (!isGitRoot(currentDir) && !currentDir.isRoot())
        currentDir = currentDir.getParentDirectory();

    return currentDir;
}