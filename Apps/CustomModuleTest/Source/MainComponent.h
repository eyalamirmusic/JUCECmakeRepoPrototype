#pragma once

#include <JuceHeader.h>

class MainComponent   : public Component
{
public:

    MainComponent();

    void paint (Graphics&) override;
    void resized() override;

private:
    DummyLabel dummyLabel;
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (MainComponent)
};
