cmake_minimum_required(VERSION 3.4)

include(GitHelpers)

function(build_projucer_func projucerEXE)
    set(projucerDir "${PROJECT_SOURCE_DIR}/JUCE/extras/Projucer/Builds")

    if (APPLE)
        set(projucerBuildDir "${projucerDir}/MacOSX")

        execute_process(COMMAND "xcodebuild" "-configuration" "Release"
                WORKING_DIRECTORY ${projucerBuildDir})

        set(${projucerEXE} "${projucerBuildDir}/build/Release/Projucer.app" PARENT_SCOPE)
    else ()
        set(projucerBuildDir "${projucerDir}/VisualStudio2019")
        message("Remember to set up the build for non-apple systems")
    endif ()
endfunction()

macro(update_juce branch)
    set(juceGit "https://github.com/WeAreROLI/JUCE.git")
    update_git(${juceGit} "${globalSDKsFolder}/JUCE" ${branch})

    if (alwaysBuildProjucer)
        build_projucer_func(projucerEXE)
    endif ()

    set(juceDirectory "${globalSDKsFolder}/JUCE" CACHE INTERNAL "")
    set(juceModulesDir "${juceDirectory}/modules" CACHE INTERNAL "")
endmacro()

function(add_plist_file targetName)
    if (APPLE)
        set (plistFile "${CMAKE_SOURCE_DIR}/SDKs/Cmake/Info-App.plist")

        set_target_properties(${targetName} PROPERTIES
                MACOSX_BUNDLE_INFO_PLIST ${plistFile})
    endif ()

endfunction()


macro(set_target_names)
    set (SHARED_CODE_TARGET "${PROJECT_NAME}_SharedCode")
    set (VST3_TARGET "${PROJECT_NAME}_VST3")
    set (AU_TARGET "${PROJECT_NAME}_AU")
    set (STANDALONE_TARGET "${PROJECT_NAME}_Standalone")
endmacro()

macro(set_vst3_target_properties)
    if (APPLE)
        set_target_properties(${VST3_TARGET} PROPERTIES
                BUNDLE TRUE
                BUNDLE_EXTENSION "vst3"
                )
    elseif (WIN32)
        set_target_properties(${VST3_TARGET} PROPERTIES SUFFIX ".vst3")
    endif ()
endmacro()

macro(add_vst3_target)
    add_library(${VST3_TARGET} MODULE "")

    target_compile_definitions(${VST3_TARGET} PRIVATE JucePlugin_Build_VST3=1)

    target_include_directories(${VST3_TARGET} PRIVATE
            "${JUCE_MODULES_DIR}/juce_audio_processors/format_types/VST3_SDK")

    target_link_libraries(${VST3_TARGET} PRIVATE
            ${SHARED_CODE_TARGET}
            JUCE::juce_audio_plugin_client::sources::VST3)

    set_vst3_target_properties()

    post_build_copy_vst3(${VST3_TARGET})
endmacro()

macro (add_standalone_target)

    add_executable(${STANDALONE_TARGET} WIN32 MACOSX_BUNDLE "")
    target_compile_definitions(${STANDALONE_TARGET} PRIVATE JucePlugin_Build_Standalone=1)
    add_plist_file(${STANDALONE_TARGET})

    target_link_libraries(${STANDALONE_TARGET} PRIVATE
            ${SHARED_CODE_TARGET}
            JUCE::juce_audio_plugin_client::sources::Standalone)
endmacro()

function (get_vst3_folder folder)
    set (folder "$ENV{HOME}/Library/Audio/Plug-Ins/VST3" PARENT_SCOPE )
endfunction()

function(juce_set_bundle_properties target)
    if(APPLE)
        set_target_properties(${target}
                PROPERTIES
                OUTPUT_NAME ${PRODUCT_NAME}
                XCODE_ATTRIBUTE_PRODUCT_NAME ${PRODUCT_NAME}
                BUNDLE true
                XCODE_ATTRIBUTE_MACH_O_TYPE mh_bundle
                XCODE_ATTRIBUTE_WARNING_CFLAGS "-Wmost -Wno-four-char-constants -Wno-unknown-pragmas"
                XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE "YES"
                XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION YES
                XCODE_ATTRIBUTE_DSTROOT "/"
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER ${BUNDLE_IDENTIFIER}
                MACOSX_BUNDLE_GUI_IDENTIFIER ${BUNDLE_IDENTIFIER}
                MACOSX_BUNDLE_BUNDLE_VERSION ${VERSION}
                BUNDLE_EXTENSION "${OSX_EXTENSION}"
                XCODE_ATTRIBUTE_WRAPPER_EXTENSION "${OSX_EXTENSION}"
                XCODE_ATTRIBUTE_INSTALL_PATH "${OSX_INSTALL_PATH}"
                XCODE_ATTRIBUTE_INFOPLIST_FILE ${PLIST}
                MACOSX_BUNDLE_INFO_PLIST ${PLIST}
                XCODE_ATTRIBUTE_CURRENT_PROJECT_VERSION ${VERSION}
                )
    endif()
endfunction()

function(post_build_copy_vst3 target)
    juce_set_bundle_properties(${target})
    get_vst3_folder(folder)
    post_build_copy(${target} ${folder})
endfunction()