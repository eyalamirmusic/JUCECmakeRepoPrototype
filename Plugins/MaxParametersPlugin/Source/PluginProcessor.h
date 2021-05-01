#pragma once

#include <shared_plugin_helpers/shared_plugin_helpers.h>

//Inhereting from AudioProcessorBase, which is just inhereting from juce::AudioProcessor
//And adding some default implementations

class MaxParamsProcessor : public AudioProcessorBase
{
public:
    MaxParamsProcessor();

    void processBlock(juce::AudioBuffer<float>& buffer,
                      juce::MidiBuffer& midiMessages) override;

    bool hasEditor() const override;
    juce::AudioProcessorEditor* createEditor() override;
};
