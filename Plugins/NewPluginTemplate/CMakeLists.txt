cmake_minimum_required(VERSION 3.4)

project("NewPluginTemplate")

set(companyName "Eyal Amir")
set(pluginName ${PROJECT_NAME})

aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/Source" JUCER_PROJECT_FILES)

jucer_project_begin(JUCER_VERSION "5.4.7" PROJECT_ID "MSisJh")

create_default_audio_plugin()

jucer_audio_plugin_settings(PLUGIN_MANUFACTURER_CODE "Manu"  PLUGIN_CODE "Msis")

add_jucer_windows_target()
add_jucer_mac_target()

jucer_project_end()
