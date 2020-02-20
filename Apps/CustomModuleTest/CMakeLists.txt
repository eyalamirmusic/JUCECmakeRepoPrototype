cmake_minimum_required(VERSION 3.4)

project("CustomModuleTest")

set(companyName "Eyal Amir")
set(pluginName ${PROJECT_NAME})

jucer_project_begin(JUCER_VERSION "5.4.7" PROJECT_ID "MSisJh")

set_default_jucer_project_settings("GUI Application")

aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/Source" JUCER_PROJECT_FILES)

add_juce_core()
add_juce_data_structures()
add_juce_events()
add_juce_graphics()
add_juce_gui_basics()
add_juce_gui_extra()

add_custom_module("custom_module_test" ${customModulesDir})

add_all_jucer_targets()

jucer_project_end()
