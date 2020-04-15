juce_add_plugin(NewPluginTemplate
    # VERSION ...                               # Set this if the plugin version is different to the project version
    # ICON_BIG ...                              # ICON_* arguments specify a path to an image file to use as an icon for the Standalone
    # ICON_SMALL ...
    COMPANY_NAME "MyCompany"
    IS_SYNTH FALSE
    NEEDS_MIDI_INPUT TRUE
    NEEDS_MIDI_OUTPUT FALSE
    IS_MIDI_EFFECT FALSE
    EDITOR_WANTS_KEYBOARD_FOCUS FALSE
    COPY_PLUGIN_AFTER_BUILD TRUE
    PLUGIN_MANUFACTURER_CODE Juce
    PLUGIN_CODE Dem0
    FORMATS AU VST3 Standalone
    PRODUCT_NAME "New Plugin Template")

juce_generate_juce_header(NewPluginTemplate)

target_sources(NewPluginTemplate PRIVATE
    Source/PluginProcessor.cpp          Source/PluginProcessor.h
    Source/PluginEditor.cpp             Source/PluginEditor.h)

target_compile_definitions(NewPluginTemplate PUBLIC
    JUCE_WEB_BROWSER=0
    JUCE_USE_CURL=0
    JUCE_VST3_CAN_REPLACE_VST2=0)

target_link_libraries(NewPluginTemplate PRIVATE juce::juce_audio_utils)
