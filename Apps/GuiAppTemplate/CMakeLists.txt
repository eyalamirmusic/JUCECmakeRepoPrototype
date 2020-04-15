juce_add_gui_app(GuiAppTemplate PRODUCT_NAME "Gui App Example")

juce_generate_juce_header(GuiAppTemplate)

target_sources(GuiAppTemplate PRIVATE
    Source/Main.cpp
    Source/MainComponent.cpp            Source/MainComponent.h
    Source/MainWindow.cpp               Source/MainWindow.h)

target_compile_definitions(GuiAppTemplate PRIVATE
    JUCE_WEB_BROWSER=0
    JUCE_USE_CURL=0
    JUCE_APPLICATION_NAME_STRING="$<TARGET_PROPERTY:GuiAppTemplate,JUCE_PROJECT_NAME>"
    JUCE_APPLICATION_VERSION_STRING="$<TARGET_PROPERTY:GuiAppTemplate,JUCE_VERSION>")

target_link_libraries(GuiAppTemplate PRIVATE juce::juce_gui_extra)
