cmake_minimum_required(VERSION 3.12)
project(CustomModuleTest VERSION 0.0.1)

juce_add_gui_app(GuiAppExample
        PRODUCT_NAME "Custom Module Test")

juce_generate_juce_header(CustomModuleTest)

aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/Source" Sources)
target_sources(CustomModuleTest PRIVATE ${Sources})

target_compile_definitions(GuiAppExample PRIVATE
        JUCE_WEB_BROWSER=0
        JUCE_USE_CURL=0
        JUCE_APPLICATION_NAME_STRING="$<TARGET_PROPERTY:CustomModuleTest,JUCE_PROJECT_NAME>"
        JUCE_APPLICATION_VERSION_STRING="$<TARGET_PROPERTY:CustomModuleTest,JUCE_VERSION>")

target_link_libraries(GuiAppExample PRIVATE juce::juce_gui_extra)
