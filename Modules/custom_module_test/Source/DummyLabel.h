#pragma once

namespace CustomModule
{
class DummyLabel : public juce::Component
{
public:
    DummyLabel();

    void resized() override;

private:
    juce::Label label;
};

} // namespace CustomModule
