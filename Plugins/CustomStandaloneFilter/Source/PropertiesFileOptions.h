#pragma once

#include <JuceHeader.h>

struct PropertiesFileOptions : public PropertiesFile::Options
{
    PropertiesFileOptions()
    {
        applicationName = JucePlugin_Name;
        filenameSuffix = ".settings";
        osxLibrarySubFolder = "Application Support";
        folderName = getOptionsFolderName();
    }

    static String getOptionsFolderName()
    {
#if JUCE_LINUX
        return "~/.config";
#else
        return "";
#endif
    }
};