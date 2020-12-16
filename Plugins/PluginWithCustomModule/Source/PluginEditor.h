#pragma once

#include <juce_audio_processors/juce_audio_processors.h>
#include "PluginProcessor.h"

class PluginWithCustomModuleEditor : public juce::AudioProcessorEditor
{
public:
    explicit PluginWithCustomModuleEditor(PluginWithCustomModule&);

    void paint(juce::Graphics&) override;
    void resized() override;

};
