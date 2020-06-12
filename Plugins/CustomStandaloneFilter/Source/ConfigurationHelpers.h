#pragma once

#include <JuceHeader.h>

namespace Helpers
{
inline Colour getBackgroundColor()
{
    auto colorID = ResizableWindow::backgroundColourId;

    return LookAndFeel::getDefaultLookAndFeel().findColour(colorID);
}

inline Array<StandalonePluginHolder::PluginInOuts> getChannelConfigurations()
{
#ifdef JucePlugin_PreferredChannelConfigurations
    StandalonePluginHolder::PluginInOuts channels[] = {
        JucePlugin_PreferredChannelConfigurations};

    return juce::Array<StandalonePluginHolder::PluginInOuts>(
        channels, juce::numElementsInArray(channels));
#else
    return {};
#endif
}

inline bool shouldAutoOpenMidiDevices()
{
#if JUCE_DONT_AUTO_OPEN_MIDI_DEVICES_ON_MOBILE
    return false;
#endif
    return true;
}

inline bool shouldUseKioskMode()
{
#if JUCE_STANDALONE_FILTER_WINDOW_USE_KIOSK_MODE
    return true;
#endif
    return false;
}

} // namespace Helpers