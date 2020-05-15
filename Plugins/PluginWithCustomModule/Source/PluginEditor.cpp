#include "PluginProcessor.h"
#include "PluginEditor.h"

PluginWithCustomModuleEditor::PluginWithCustomModuleEditor(PluginWithCustomModule& p)
    : AudioProcessorEditor(&p)
{
    setSize(400, 300);
}

void PluginWithCustomModuleEditor::paint(Graphics& g)
{
    g.fillAll(getLookAndFeel().findColour(ResizableWindow::backgroundColourId));
}

void PluginWithCustomModuleEditor::resized()
{
}
