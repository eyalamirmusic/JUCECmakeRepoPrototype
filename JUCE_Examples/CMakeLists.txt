cmake_minimum_required(VERSION 3.12)
project(JUCE_Examples VERSION 1.0)

set (ExamplesDir ${JUCE_PATH}/Examples)

#By default, building DemoRunner is enough. Change this to 'TRUE' if you want to build all examples:
set (ShouldBuildAllExamples FALSE)

if (NOT ${ShouldBuildAllExamples})
    set(ExamplesDir ${ExamplesDir}/DemoRunner)
endif()

add_subdirectory(${ExamplesDir} ${CMAKE_CURRENT_BINARY_DIR}/examples)