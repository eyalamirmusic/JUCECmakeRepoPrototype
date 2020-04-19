project(JUCE_Examples VERSION 1.0)

add_juce_missing_linux_pacakges()

set (ExamplesDir ${JUCE_SOURCE_ROOT}/examples)

#By default, building DemoRunner is enough. Change this to 'TRUE' if you want to build all examples:
set (ShouldBuildAllExamples FALSE)

if (NOT ${ShouldBuildAllExamples})
    set(ExamplesDir ${ExamplesDir}/DemoRunner)
endif()

add_subdirectory(${ExamplesDir} ${CMAKE_CURRENT_BINARY_DIR}/JUCE_Examples)