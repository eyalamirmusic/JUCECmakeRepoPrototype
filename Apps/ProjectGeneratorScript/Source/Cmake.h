#pragma once

#include "Helpers.h"

File initBuildFolder(const File& directory)
{
    auto buildDir = directory.getChildFile("build");

    if (buildDir.exists())
        buildDir.deleteRecursively(true);

    buildDir.createDirectory();

    return buildDir;
}

String getCmakeExporter()
{
    if (isMac())
        return "Xcode";

    return "Visual Studio 16 2019";
}

String getCmakeCommand()
{
    return "cmake .. -G ";
}

void runCmake(const File& buildDir)
{
    buildDir.setAsCurrentWorkingDirectory();
    runCommand(getCmakeCommand() + getCmakeExporter());
}