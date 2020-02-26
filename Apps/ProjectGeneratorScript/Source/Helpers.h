#pragma once

constexpr bool isMac()
{
#if JUCE_MAC
    return true;
#else
    return false;
#endif
}

void runCommand(const String& command)
{
    ChildProcess p;

    p.start(command);
    while (p.isRunning()) {}

    Logger::writeToLog(p.readAllProcessOutput());
}

