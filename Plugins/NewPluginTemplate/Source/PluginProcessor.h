#pragma once

#include <JuceHeader.h>

struct Parameters
{
    void add(AudioProcessor& processor) const
    {
        processor.addParameter(gain);
        processor.addParameter(enable);
    }

    AudioParameterFloat* gain = new AudioParameterFloat("Gain", "Gain", 0.f, 1.f, 0.5f);
    AudioParameterBool* enable = new AudioParameterBool("Enable", "Enable", true);
};

class NewPluginTemplateAudioProcessor : public AudioProcessor
{
public:
    NewPluginTemplateAudioProcessor();

    void prepareToPlay(double sampleRate, int blockSize) override;
    void releaseResources() override {}

    bool isBusesLayoutSupported(const BusesLayout&) const override { return true; }

    void processBlock(AudioBuffer<float>&, MidiBuffer&) override;

    AudioProcessorEditor* createEditor() override;
    bool hasEditor() const override { return true; }

    const String getName() const override { return JucePlugin_Name; }

    bool acceptsMidi() const override { return true; }
    bool producesMidi() const override { return false; }
    bool isMidiEffect() const override { return false; }
    double getTailLengthSeconds() const override { return 0.0; }

    int getNumPrograms() override { return 1; }
    int getCurrentProgram() override { return 0; }
    void setCurrentProgram(int) override {}
    const String getProgramName(int) override { return String(); }
    void changeProgramName(int, const String& /*newName*/) override {}

    void getStateInformation(MemoryBlock& /*destData*/) override {}
    void setStateInformation(const void* /*data*/, int /*sizeInBytes*/) override {}

private:
    Parameters parameters;
};
