#include "PluginProcessor.h"
#include "PluginEditor.h"

constexpr bool shouldUseGenericEditor = true;

NewPluginTemplateAudioProcessor::NewPluginTemplateAudioProcessor()
{
    parameters.add(*this);
}

void NewPluginTemplateAudioProcessor::processBlock(juce::AudioBuffer<float>& buffer,
                                                   juce::MidiBuffer& /*midiMessages*/)

{
    if (parameters.enable->get())
        buffer.applyGain(parameters.gain->get());
    else
        buffer.clear();
}

juce::AudioProcessorEditor* NewPluginTemplateAudioProcessor::createEditor()
{
    if (shouldUseGenericEditor)
        return new juce::GenericAudioProcessorEditor(*this);
    else
        return new NewPluginTemplateAudioProcessorEditor(*this);
}

juce::AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new NewPluginTemplateAudioProcessor();
}
