#pragma once

#include "PluginProcessor.h"

class MinimalPluginEditor : public juce::AudioProcessorEditor
{
public:
    explicit MinimalPluginEditor(MinimalAudioPlugin& processorToUse)
        : juce::AudioProcessorEditor(processorToUse)
        , genericEditor(processorToUse)
    {
        addAndMakeVisible(genericEditor);
        setSize(400, 300);
    }

    void resized() override { genericEditor.setBounds(getLocalBounds()); }

    juce::GenericAudioProcessorEditor genericEditor;
};
