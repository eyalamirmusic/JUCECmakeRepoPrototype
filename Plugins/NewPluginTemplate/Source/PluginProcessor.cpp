#include "PluginProcessor.h"
#include "PluginEditor.h"

NewPluginTemplateAudioProcessor::NewPluginTemplateAudioProcessor()
{
}

void NewPluginTemplateAudioProcessor::prepareToPlay(double /*sampleRate*/, int /*blockSize*/)
{

}

void NewPluginTemplateAudioProcessor::processBlock(AudioBuffer<float>& buffer,
                                                   MidiBuffer& midiMessages)

{
    midiMessages.clear();
    buffer.clear();
}

AudioProcessorEditor* NewPluginTemplateAudioProcessor::createEditor()
{
    return new NewPluginTemplateAudioProcessorEditor(*this);
}

AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new NewPluginTemplateAudioProcessor();
}
