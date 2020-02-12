#pragma once

#include "JuceHeader.h"

class WhiteNoiseProcessor
{
public:
    void process(AudioBuffer<float>& buffer, int startSample, int numSamples)
    {
        for (int sample = startSample; sample < numSamples; ++sample)
        {
            auto f = rand.nextFloat();
            auto nextVal = jmap(f, -1.f, 1.f);
            nextVal *= 0.01f;

            for (auto channel = 0; channel < buffer.getNumChannels(); ++channel)
                buffer.setSample(channel, sample, nextVal);
        }
    }

    Random rand;
};

class SynthSound : public SynthesiserSound
{
public:
    bool appliesToNote(int midiNoteNumber) override
    {
        return true;
    }
    bool appliesToChannel(int midiChannel) override
    {
        return true;
    }
};

class SynthVoice : public SynthesiserVoice
{
public:
    SynthVoice()
    {
        ADSR::Parameters p;
        p.attack = 1.f;
        p.release = 1.f;
        p.decay = 1.f;
        p.sustain = 1.f;

        adsr.setParameters(p);
    }

    bool canPlaySound(SynthesiserSound* sound) override
    {
        return true;
    }
    void startNote(int midiNoteNumber, float velocity, SynthesiserSound* sound, int currentPitchWheelPosition) override
    {
        adsr.noteOn();
    }

    void stopNote(float velocity, bool allowTailOff) override
    {
        if (allowTailOff)
            adsr.noteOff();
        else
            clearNote();

    }

    void pitchWheelMoved(int newPitchWheelValue) override
    {

    }
    void controllerMoved(int controllerNumber, int newControllerValue) override
    {

    }
    void renderNextBlock(AudioBuffer<float>& outputBuffer, int startSample, int numSamples) override
    {
        if (adsr.isActive())
        {
            noise.process(outputBuffer, startSample, numSamples);
            adsr.applyEnvelopeToBuffer(outputBuffer, startSample, numSamples);
        }
        else
            clearNote();
    }

    void clearNote()
    {
        adsr.reset();
        clearCurrentNote();
    }


    bool isPlaying = false;

    ADSR adsr;
    WhiteNoiseProcessor noise;
};

class Synth : public Synthesiser
{
public:
    Synth()
    {
        addVoice(new SynthVoice());
        addSound(new SynthSound());
    }
};