project(ConsoleAppMessageThread VERSION 0.1)

set (TargetName ${PROJECT_NAME})

juce_add_console_app(${TargetName} PRODUCT_NAME "Console App Message Thread")

target_sources(${TargetName} PRIVATE Main.cpp)

target_compile_definitions(${TargetName} PRIVATE
        JUCE_WEB_BROWSER=0
        JUCE_USE_CURL=0)

target_link_libraries(${TargetName} PRIVATE
        juce_recommended_config_flags
        juce_recommended_lto_flags
        juce_recommended_warning_flags
        juce_gui_basics)

