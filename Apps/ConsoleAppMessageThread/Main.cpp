#include <juce_gui_basics/juce_gui_basics.h>

struct MyTimer : juce::Timer
{
    MyTimer() { startTimerHz(1); }
    ~MyTimer() override { stopTimer(); }
    void timerCallback() override
    {
        std::cout << "Called on a timer!\n";

        if (x++ > 10)
            juce::JUCEApplicationBase::quit();
    }

    int x = 0;
};

struct App : juce::JUCEApplication
{
    const juce::String getApplicationName() override
    {
        return "Console App Message Thread";
    }

    const juce::String getApplicationVersion() override { return "0.1"; }
    void initialise(const juce::String&) override
    {
        //This is called on the message thread
    }

    void shutdown() override {}

    MyTimer timer;
};

START_JUCE_APPLICATION(App)