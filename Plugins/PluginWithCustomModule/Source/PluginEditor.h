#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

class PluginWithCustomModuleEditor : public AudioProcessorEditor
{
public:
    explicit PluginWithCustomModuleEditor(PluginWithCustomModule&);

    void paint(Graphics&) override;
    void resized() override;

private:
    PluginWithCustomModule& processor;
};
