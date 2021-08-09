#pragma once

//A very simple white noise oscillator
namespace WhiteNoise
{
class Oscillator
{
public:
    Oscillator();
    void process(juce::AudioBuffer<float>& buffer) noexcept;
    float getNextSample();

private:
    int samplePos = 0;

    juce::Random rand;
    std::vector<float> samples;
};
}
