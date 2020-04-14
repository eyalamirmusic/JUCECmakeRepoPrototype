cmake_minimum_required(VERSION 3.12)
project(ConsoleAppExample VERSION 0.0.1)

juce_add_console_app(ConsoleAppExample PRODUCT_NAME "Console App Example")
juce_generate_juce_header(ConsoleAppExample)

aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/Source" Sources)
target_sources(ConsoleAppExample PRIVATE ${Sources})
target_compile_definitions(ConsoleAppExample PRIVATE
        JUCE_WEB_BROWSER=0
        JUCE_USE_CURL=0)

target_link_libraries(ConsoleAppExample PRIVATE juce::juce_core)
