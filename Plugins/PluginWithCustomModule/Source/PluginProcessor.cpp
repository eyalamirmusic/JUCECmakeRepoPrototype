#include "PluginProcessor.h"
#include "PluginEditor.h"

PluginWithCustomModule::PluginWithCustomModule()
{

}

void PluginWithCustomModule::prepareToPlay(double /*sampleRate*/, int /*blockSize*/)
{

}

void PluginWithCustomModule::processBlock(AudioBuffer<float>& buffer,
                                                   MidiBuffer&)

{
    whiteNoise.process(buffer);
}

AudioProcessorEditor* PluginWithCustomModule::createEditor()
{
    return new PluginWithCustomModuleEditor(*this);
}

AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new PluginWithCustomModule();
}
