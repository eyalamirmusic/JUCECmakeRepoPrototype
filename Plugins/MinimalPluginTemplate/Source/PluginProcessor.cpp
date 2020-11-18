#include "PluginProcessor.h"
#include "PluginEditor.h"

MinimalAudioPlugin::MinimalAudioPlugin()
    : AudioProcessorBase(getDefaultProperties())
{
}

void MinimalAudioPlugin::prepareToPlay(double sampleRate, int samplesPerBlock)
{
    juce::ignoreUnused(sampleRate, samplesPerBlock);
}

void MinimalAudioPlugin::processBlock(juce::AudioBuffer<float>& buffer,
                                      juce::MidiBuffer& midiMessages)
{
    juce::ignoreUnused(midiMessages);

    for (int channel = 0; channel < buffer.getNumChannels(); ++channel)
    {
        auto* channelData = buffer.getWritePointer(channel);

        for (int sample = 0; sample < buffer.getNumSamples(); ++sample)
        {
            //Just silences all the buffers, but you might want replace that with something better:
            channelData[sample] = 0.f;
        }
    }
}

juce::AudioProcessorEditor* MinimalAudioPlugin::createEditor()
{
    return new MinimalPluginEditor(*this);
}

void MinimalAudioPlugin::getStateInformation(juce::MemoryBlock& destData)
{
    juce::ignoreUnused(destData);
}

void MinimalAudioPlugin::setStateInformation(const void* data, int sizeInBytes)
{
    juce::ignoreUnused(data, sizeInBytes);
}

juce::AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new MinimalAudioPlugin();
}
