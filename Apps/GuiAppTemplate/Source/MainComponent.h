#pragma once

#include <JuceHeader.h>

struct HelloWorldLabel: public Label
{
    HelloWorldLabel()
    {
        setText("HelloWorld", dontSendNotification);
        setJustificationType(Justification::centred);
        setFont(Font(20));
    }
};

class MainComponent   : public Component
{
public:

    MainComponent();

    void paint (Graphics&) override;
    void resized() override;

private:
    HelloWorldLabel helloWorld;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (MainComponent)
};
