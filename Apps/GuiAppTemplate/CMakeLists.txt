cmake_minimum_required(VERSION 3.12)
project(GUI_APP_EXAMPLE VERSION 0.0.1)

juce_add_gui_app(GuiAppExample
        PRODUCT_NAME "Gui App Example")

 juce_generate_juce_header(GuiAppExample)

aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/Source" Sources)
target_sources(GuiAppExample PRIVATE ${Sources})

target_compile_definitions(GuiAppExample PRIVATE
        JUCE_WEB_BROWSER=0
        JUCE_USE_CURL=0
        JUCE_APPLICATION_NAME_STRING="$<TARGET_PROPERTY:GuiAppExample,JUCE_PROJECT_NAME>"
        JUCE_APPLICATION_VERSION_STRING="$<TARGET_PROPERTY:GuiAppExample,JUCE_VERSION>")

target_link_libraries(GuiAppExample PRIVATE juce::juce_gui_extra)
