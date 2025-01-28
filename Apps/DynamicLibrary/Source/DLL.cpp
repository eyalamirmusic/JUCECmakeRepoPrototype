#include <juce_gui_basics/juce_gui_basics.h>

#if JUCE_WINDOWS
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT
#endif

extern "C" DLLEXPORT void dllFunction();

struct TestTimer : juce::Timer
{
    TestTimer() { startTimer(500); }

    void timerCallback() override { std::cout << "Logging from the DLL!\n"; }
};

DLLEXPORT void dllFunction()
{
    auto init = juce::ScopedJuceInitialiser_GUI();
    auto mm = juce::MessageManager::getInstance();
    auto timer = TestTimer();

    mm->runDispatchLoopUntil(5000);
}
