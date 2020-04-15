project(CustomModuleTest VERSION 0.0.1)

juce_add_gui_app(${PROJECT_NAME} PRODUCT_NAME "Custom Module Test")

juce_generate_juce_header(${PROJECT_NAME})

set(Sources
        Source/Main.cpp
        Source/MainComponent.cpp
        Source/MainWindow.cpp)

target_sources(${PROJECT_NAME} PRIVATE ${Sources})

target_compile_definitions(${PROJECT_NAME} PRIVATE
        JUCE_WEB_BROWSER=0
        JUCE_USE_CURL=0
        JUCE_APPLICATION_NAME_STRING="$<TARGET_PROPERTY:CustomModuleTest,JUCE_PROJECT_NAME>"
        JUCE_APPLICATION_VERSION_STRING="$<TARGET_PROPERTY:CustomModuleTest,JUCE_VERSION>")

target_link_libraries(${PROJECT_NAME} PRIVATE
        juce::juce_gui_extra
        custom_module_test)
