cmake_minimum_required(VERSION 3.4)

project("GuiAppTemplate")

set(companyName "Eyal Amir")
set(pluginName ${PROJECT_NAME})

jucer_project_begin(JUCER_VERSION "5.4.7" PROJECT_ID "MSisJh")

set_default_jucer_project_settings()

aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/Source" JUCER_PROJECT_FILES)

add_juce_core()
add_juce_data_structures()
add_juce_events()
add_juce_graphics()
add_juce_gui_basics()
add_juce_gui_extra()

add_jucer_mac_target()
add_jucer_windows_target()
add_jucer_linux_target()
add_jucer_ios_target()

jucer_project_end()
