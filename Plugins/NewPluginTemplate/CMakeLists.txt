cmake_minimum_required(VERSION 3.4)

project("NewPluginTemplate")

set(companyName "Eyal Amir")
set(pluginName ${PROJECT_NAME})

aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/Source" JUCER_PROJECT_FILES)

jucer_project_begin(JUCER_VERSION "5.4.7" PROJECT_ID "MSisJh")

set_default_jucer_project_settings()
set_default_audio_plugin_settings()
jucer_audio_plugin_settings(PLUGIN_MANUFACTURER_CODE "Manu"  PLUGIN_CODE "Msis")

add_juce_audio_basics()
add_juce_audio_devices()
add_juce_audio_formats()
add_juce_audio_plugin_client()
add_juce_audio_processors()
add_juce_audio_utils()
add_juce_core()
add_juce_data_structures()
add_juce_events()
add_juce_graphics()
add_juce_gui_basics()
add_juce_gui_extra()

add_jucer_windows_target()
add_jucer_mac_target()

jucer_project_end()
