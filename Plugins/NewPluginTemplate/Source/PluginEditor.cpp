#include "PluginProcessor.h"
#include "PluginEditor.h"

NewPluginTemplateAudioProcessorEditor::NewPluginTemplateAudioProcessorEditor (NewPluginTemplateAudioProcessor& p)
    : AudioProcessorEditor (&p), processor (p)
{
    setSize (400, 300);
}

void NewPluginTemplateAudioProcessorEditor::paint (Graphics& g)
{
    g.fillAll (getLookAndFeel().findColour (ResizableWindow::backgroundColourId));
}

void NewPluginTemplateAudioProcessorEditor::resized()
{

}
