#pragma once

#include <JuceHeader.h>

//A little templated helper needed because we already have a raw pointer
//with a concrete type And APVTS expects a unique_ptr
template <typename ParamType>
std::unique_ptr<ParamType> getUnique(ParamType* param)
{
    return std::unique_ptr<ParamType>(param);
}

struct Parameters
{
    //APVTS version
    AudioProcessorValueTreeState::ParameterLayout getLayout() const
    {
        return {getUnique(gain), getUnique(enable)};
    }
    //Non-APVTS version
    void add(AudioProcessor& processor) const
    {
        processor.addParameter(gain);
        processor.addParameter(enable);
    }

    //Raw pointers. They will be owned by either the processor or the APVTS (if you use it)
    AudioParameterFloat* gain = new AudioParameterFloat("Gain", "Gain", 0.f, 1.f, 0.5f);
    AudioParameterBool* enable = new AudioParameterBool("Enable", "Enable", true);
};