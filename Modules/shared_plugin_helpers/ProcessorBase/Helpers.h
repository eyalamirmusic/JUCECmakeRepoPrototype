#pragma once

#include <juce_audio_processors/juce_audio_processors.h>

namespace PluginHelpers
{
juce::ValueTree saveParamsTree(const juce::AudioProcessor& processor);

void loadParamsTree(const juce::AudioProcessor& processor,
                           const juce::ValueTree& tree);
} // namespace PluginHelpers