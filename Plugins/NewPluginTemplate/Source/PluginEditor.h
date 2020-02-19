#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

class NewPluginTemplateAudioProcessorEditor  : public AudioProcessorEditor
{
public:
    explicit NewPluginTemplateAudioProcessorEditor (NewPluginTemplateAudioProcessor&);

    void paint (Graphics&) override;
    void resized() override;

private:
    NewPluginTemplateAudioProcessor& processor;
};
