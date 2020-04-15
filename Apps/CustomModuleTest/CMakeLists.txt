juce_add_gui_app(CustomModuleTest PRODUCT_NAME "Custom Module Test")

juce_generate_juce_header(CustomModuleTest)

target_sources(CustomModuleTest PRIVATE
    Source/Main.cpp
    Source/MainComponent.cpp            Source/MainComponent.h
    Source/MainWindow.cpp               Source/MainWindow.h)

target_compile_definitions(CustomModuleTest PRIVATE
    JUCE_WEB_BROWSER=0
    JUCE_USE_CURL=0
    JUCE_APPLICATION_NAME_STRING="$<TARGET_PROPERTY:CustomModuleTest,JUCE_PROJECT_NAME>"
    JUCE_APPLICATION_VERSION_STRING="$<TARGET_PROPERTY:CustomModuleTest,JUCE_VERSION>")

target_link_libraries(CustomModuleTest PRIVATE
    juce::juce_gui_extra
    custom_module_test)
