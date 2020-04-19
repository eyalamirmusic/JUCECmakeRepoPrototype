project(JUCE_Extras VERSION 1.0)

add_juce_missing_linux_pacakges()

add_subdirectory("${JUCE_SOURCE_ROOT}/extras" ${CMAKE_CURRENT_BINARY_DIR}/JUCE_Extras)