#include <juce_core/juce_core.h>
#include <juce_gui_extra/juce_gui_extra.h>

#if JUCE_WINDOWS
#define DLLEXPORT __declspec (dllexport)
#else
#define DLLEXPORT
#endif

extern "C" DLLEXPORT void dllFunction();

struct TestTimer: juce::Timer
{
    TestTimer()
    {
        startTimer(50);
    }

    void timerCallback() override{}
};

DLLEXPORT void dllFunction()
{
    juce::ScopedJuceInitialiser_GUI s;
    TestTimer f;
    juce::Logger::writeToLog("Logging from the DLL!");
}
