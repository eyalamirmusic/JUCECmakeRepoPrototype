#pragma once

#include <juce_audio_utils/juce_audio_utils.h>

class MidiFXProcessor : public juce::AudioProcessor
{
public:
    void prepareToPlay(double /*sampleRate*/, int /*blockSize*/) override {}
    void releaseResources() override {}

    bool isBusesLayoutSupported(const BusesLayout&) const override { return true; }

    void processBlock(juce::AudioBuffer<float>&, juce::MidiBuffer&) override;

    juce::AudioProcessorEditor* createEditor() override;
    bool hasEditor() const override { return true; }

    const juce::String getName() const override { return JucePlugin_Name; }

    bool acceptsMidi() const override { return true; }
    bool producesMidi() const override { return true; }
    bool isMidiEffect() const override { return true; }
    double getTailLengthSeconds() const override { return 0.0; }

    int getNumPrograms() override { return 1; }
    int getCurrentProgram() override { return 0; }
    void setCurrentProgram(int) override {}
    const juce::String getProgramName(int) override { return juce::String(); }
    void changeProgramName(int, const juce::String& /*newName*/) override {}

    void getStateInformation(juce::MemoryBlock& destData) override;

    void setStateInformation(const void* data, int sizeInBytes) override;

private:

    juce::MidiBuffer tempBuffer;
};
