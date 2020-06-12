#pragma once

#include <JuceHeader.h>

class CustomStandaloneProcessor;

class CustomStandaloneEditor  : public AudioProcessorEditor
{
public:
    explicit CustomStandaloneEditor (CustomStandaloneProcessor&);

    void paint (Graphics&) override;
    void resized() override;

};
