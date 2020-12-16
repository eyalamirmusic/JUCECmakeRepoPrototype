#pragma once

#include "PluginProcessor.h"

class NewPluginTemplateAudioProcessorEditor : public juce::AudioProcessorEditor
{
public:
    explicit NewPluginTemplateAudioProcessorEditor(NewPluginTemplateAudioProcessor&);

    void paint(juce::Graphics&) override;
    void resized() override {}
};
