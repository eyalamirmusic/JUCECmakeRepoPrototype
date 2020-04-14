#include "MainComponent.h"

MainComponent::MainComponent()
{
    addAndMakeVisible(helloWorld);
    setSize (600, 400);
}

void MainComponent::paint (Graphics& g)
{
    g.fillAll (getLookAndFeel().findColour (ResizableWindow::backgroundColourId));
}

void MainComponent::resized()
{
    helloWorld.setBounds(getLocalBounds());
}
