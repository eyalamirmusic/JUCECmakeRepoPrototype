#include "MainComponent.h"

MainComponent::MainComponent()
{
    addAndMakeVisible(dummyLabel);
    setSize (600, 400);
}

void MainComponent::paint (Graphics& g)
{
    g.fillAll (getLookAndFeel().findColour (ResizableWindow::backgroundColourId));
}

void MainComponent::resized()
{
    dummyLabel.setBounds(getLocalBounds());
}
