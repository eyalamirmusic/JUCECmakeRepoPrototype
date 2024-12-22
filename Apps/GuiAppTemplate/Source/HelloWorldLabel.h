#pragma once

#include "CommonHeader.h"

namespace GuiApp
{
struct HelloWorldLabel : juce::Label
{
    HelloWorldLabel()
    {
        setText("HelloWorld", juce::dontSendNotification);
        setJustificationType(juce::Justification::centred);
        setFont({juce::FontOptions(20)});
    }
};
} // namespace GuiApp