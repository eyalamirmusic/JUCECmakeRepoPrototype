#include "AudioProcessorBase.h"

AudioProcessorBase::AudioProcessorBase()
    : juce::AudioProcessor(getDefaultProperties())
{
}

AudioProcessorBase::AudioProcessorBase(const BusesProperties& ioLayouts)
    : AudioProcessor(ioLayouts)
{
}

const juce::String AudioProcessorBase::getName() const
{
    return JucePlugin_Name;
}

bool AudioProcessorBase::acceptsMidi() const
{
#if JucePlugin_WantsMidiInput
    return true;
#else
    return false;
#endif
}

bool AudioProcessorBase::producesMidi() const
{
#if JucePlugin_ProducesMidiOutput
    return true;
#else
    return false;
#endif
}

bool AudioProcessorBase::isMidiEffect() const
{
#if JucePlugin_IsMidiEffect
    return true;
#else
    return false;
#endif
}

double AudioProcessorBase::getTailLengthSeconds() const
{
    return 0.0;
}

int AudioProcessorBase::getNumPrograms()
{
    return 1; // NB: some hosts don't cope very well if you tell them there are 0 programs,
    // so this should be at least 1, even if you're not really implementing programs.
}

int AudioProcessorBase::getCurrentProgram()
{
    return 0;
}

void AudioProcessorBase::setCurrentProgram(int index)
{
    juce::ignoreUnused(index);
}

const juce::String AudioProcessorBase::getProgramName(int index)
{
    juce::ignoreUnused(index);
    return {};
}

void AudioProcessorBase::changeProgramName(int index, const juce::String& newName)
{
    juce::ignoreUnused(index, newName);
}

//==============================================================================
void AudioProcessorBase::prepareToPlay(double sampleRate, int samplesPerBlock)
{
    // Use this method as the place to do any pre-playback
    // initialisation that you need..
    juce::ignoreUnused(sampleRate, samplesPerBlock);
}

void AudioProcessorBase::releaseResources()
{
}

juce::AudioProcessor::BusesProperties AudioProcessorBase::getDefaultProperties()
{
    return BusesProperties()
#if !JucePlugin_IsMidiEffect
#if !JucePlugin_IsSynth
        .withInput("Input", juce::AudioChannelSet::stereo(), true)
#endif
        .withOutput("Output", juce::AudioChannelSet::stereo(), true)
#endif
        ;
}

juce::AudioProcessorEditor* AudioProcessorBase::createEditor()
{
    return new juce::GenericAudioProcessorEditor(*this);
}

bool AudioProcessorBase::isBusesLayoutSupported(
    const juce::AudioProcessor::BusesLayout& layouts) const
{
    if (isMidiEffect())
        return true;
    else
    {
        if (layouts.getMainOutputChannelSet() != juce::AudioChannelSet::mono()
            && layouts.getMainOutputChannelSet() != juce::AudioChannelSet::stereo())
            return false;
    }

    // This checks if the input layout matches the output layout
#if !JucePlugin_IsSynth
    if (layouts.getMainOutputChannelSet() != layouts.getMainInputChannelSet())
        return false;
#endif

    return true;
}
void AudioProcessorBase::getStateInformation(juce::MemoryBlock& destData)
{
    juce::ignoreUnused(destData);
}

void AudioProcessorBase::setStateInformation(const void* data, int sizeInBytes)
{
    juce::ignoreUnused(data, sizeInBytes);
}
