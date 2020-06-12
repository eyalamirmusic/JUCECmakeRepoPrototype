#include "PluginProcessor.h"
#include "PluginEditor.h"

CustomStandaloneProcessor::CustomStandaloneProcessor()
{
}

void CustomStandaloneProcessor::prepareToPlay(double /*sampleRate*/, int /*blockSize*/)
{

}

void CustomStandaloneProcessor::processBlock(AudioBuffer<float>& buffer,
                                                   MidiBuffer& midiMessages)

{
    midiMessages.clear();
    buffer.clear();
}

AudioProcessorEditor* CustomStandaloneProcessor::createEditor()
{
    return new CustomStandaloneEditor(*this);
}

AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new CustomStandaloneProcessor();
}
