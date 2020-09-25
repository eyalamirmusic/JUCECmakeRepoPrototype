#include "PluginProcessor.h"
#include "PluginEditor.h"

constexpr bool shouldUseGenericEditor = true;

NewPluginTemplateAudioProcessor::NewPluginTemplateAudioProcessor()
{

}

void NewPluginTemplateAudioProcessor::prepareToPlay(double /*sampleRate*/, int /*blockSize*/)
{

}

void NewPluginTemplateAudioProcessor::processBlock(AudioBuffer<float>& buffer,
                                                   MidiBuffer& /*midiMessages*/)

{
    if (parameters.enable->get())
        buffer.applyGain(parameters.gain->get());
    else
        buffer.clear();
}

AudioProcessorEditor* NewPluginTemplateAudioProcessor::createEditor()
{
    if (shouldUseGenericEditor)
        return new GenericAudioProcessorEditor(*this);
    else
        return new NewPluginTemplateAudioProcessorEditor(*this);
}

AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new NewPluginTemplateAudioProcessor();
}
