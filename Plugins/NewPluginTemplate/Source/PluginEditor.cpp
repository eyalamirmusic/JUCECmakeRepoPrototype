#include "PluginProcessor.h"
#include "PluginEditor.h"

NewPluginTemplateAudioProcessorEditor::NewPluginTemplateAudioProcessorEditor(
    NewPluginTemplateAudioProcessor& p)
    : AudioProcessorEditor(&p)
{
    setSize(400, 300);
}

void NewPluginTemplateAudioProcessorEditor::paint(juce::Graphics& g)
{
    g.fillAll(getLookAndFeel().findColour(juce::ResizableWindow::backgroundColourId));
}

