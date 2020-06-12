#include "PluginEditor.h"
#include "PluginProcessor.h"

CustomStandaloneEditor::CustomStandaloneEditor(CustomStandaloneProcessor& p)
    : AudioProcessorEditor(&p)
{
    setSize(400, 300);
}

void CustomStandaloneEditor::paint(Graphics& g)
{
    g.fillAll(getLookAndFeel().findColour(ResizableWindow::backgroundColourId));
}

void CustomStandaloneEditor::resized()
{
}
