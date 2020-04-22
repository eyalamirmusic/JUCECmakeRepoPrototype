project(JUCE_Extras VERSION 1.0)

#This is a simple helper created to help build JUCE helper tools you might need in your project
#or as a reference, such as audio plugin host, demo runner, etc.

function (add_external_juce_folder folder)
    add_subdirectory("${JUCE_SOURCE_ROOT}/${folder}" ${CMAKE_CURRENT_BINARY_DIR}/${folder})
endfunction()

add_external_juce_folder(extras/AudioPluginHost)
add_external_juce_folder(examples/DemoRunner)

#You can also add any other project (except for Projucer, which isn't supported):

#add_external_juce_folder(extras/AudioPerformanceTest)
#add_external_juce_folder(extras/UnitTestRunner)
