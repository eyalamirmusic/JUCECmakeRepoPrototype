#include <NanoTest/NanoTest.h>
#include <juce_core/juce_core.h>

using namespace nano;

template <typename T>
bool checkMin(T first, T second)
{
    return juce::exactlyEqual(juce::jmin(first, second), std::min(first, second));
}

template <typename T>
bool checkMax(T first, T second)
{
    return juce::exactlyEqual(juce::jmax(first, second), std::max(first, second));
}

auto jminWorks = test("Test that juce::jmin works") = []
{
    check(checkMin(5, 7));
    check(checkMin(12, 3));
    check(checkMin(5.31, 5.42));
};

auto jmaxWorks = test("Test that juce::jmax works") = []
{
    check(checkMax(5, 7));
    check(checkMax(12, 3));
    check(checkMax(5.31, 5.42));
};
