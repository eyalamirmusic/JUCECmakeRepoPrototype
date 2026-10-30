project(UnitTestRunner VERSION 0.1)

set_property(GLOBAL PROPERTY CTEST_TARGETS_ADDED 1)
include(CTest)

#Declaring that we want 'nanotest', a testing framework.
#Instructions on how to find it would appear under CMake/Findnanotest.cmake
find_package(nanotest REQUIRED)

juce_add_console_app(UnitTestRunner PRODUCT_NAME "Unit Test Runner")

target_sources(UnitTestRunner PRIVATE Tests.cpp)

#nanotest requires C++20, while JUCE only asks for C++17:
target_compile_features(UnitTestRunner PRIVATE cxx_std_20)

target_compile_definitions(UnitTestRunner PRIVATE
        JUCE_WEB_BROWSER=0
        JUCE_USE_CURL=0)

target_link_libraries(UnitTestRunner PRIVATE
        juce_recommended_config_flags
        juce_recommended_lto_flags
        juce_recommended_warning_flags
        juce_core)

#Links nanotest (with its generated main()) and registers each test with CTest
nano_setup_target(UnitTestRunner WITH_MAIN)
