#pragma once

#include "CommonHeader.h"

namespace GuiApp
{
struct HelloWorldLabel
    : public juce::Label
    , juce::FileDragAndDropTarget
{
    HelloWorldLabel()
    {
        setText("HelloWorld", juce::dontSendNotification);
        setJustificationType(juce::Justification::centred);
        setFont(juce::Font(20));
    }

    bool isInterestedInFileDrag(const juce::StringArray& /*files*/) override
    {
        return true;
    }

    void filesDropped(const juce::StringArray& /*files*/, int /*x*/, int /*y*/) override
    {
        std::cout << "Files Dropped\n";
    }
};
} // namespace GuiApp