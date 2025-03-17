#include "Helpers.h"

namespace PluginHelpers
{
static juce::String getParamID(juce::AudioProcessorParameter* param)
{
    if (auto paramWithID = dynamic_cast<juce::AudioProcessorParameterWithID*>(param))
        return paramWithID->paramID;

    return param->getName(50);
}

static juce::String getValueString()
{
    return {"Value"};
}

juce::ValueTree saveParamsTree(const juce::AudioProcessor& processor)
{
    auto params = juce::ValueTree("Params");

    for (auto& param: processor.getParameters())
    {
        auto paramTree = juce::ValueTree(getParamID(param));
        paramTree.setProperty(getValueString(), param->getValue(), nullptr);
        params.appendChild(paramTree, nullptr);
    }

    return params;
}

void loadParamsTree(const juce::AudioProcessor& processor, const juce::ValueTree& tree)
{
    for (auto& param: processor.getParameters())
    {
        auto paramTree = tree.getChildWithName(getParamID(param));

        if (paramTree.isValid())
            param->setValueNotifyingHost(paramTree[getValueString()]);
    }
}
} // namespace PluginHelpers