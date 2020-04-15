juce_add_console_app(ConsoleAppTemplate PRODUCT_NAME "Console App Example")
juce_generate_juce_header(ConsoleAppTemplate)

target_sources(ConsoleAppTemplate PRIVATE Source/Main.cpp)

target_compile_definitions(ConsoleAppTemplate PRIVATE
    JUCE_WEB_BROWSER=0
    JUCE_USE_CURL=0)

target_link_libraries(ConsoleAppTemplate PRIVATE juce::juce_core)
