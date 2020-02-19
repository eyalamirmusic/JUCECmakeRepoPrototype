cmake_minimum_required(VERSION 3.4)

include(GitHelpers)

function(configure_frut frutDirectory)
    execute_process(COMMAND
            "cmake"
            "."
            "-DJUCE_ROOT=../JUCE"
            "-DCMAKE_BUILD_TYPE=Release"

            WORKING_DIRECTORY ${frutDirectory})
endfunction()

function(build_reprojucer frutDirectory)
    execute_process(COMMAND
            "cmake"
            "--build"
            "."
            "--target" "Jucer2Reprojucer"
            "--config" "Release"

            WORKING_DIRECTORY ${frutDirectory})
endfunction()

function(get_reprojucer_exe reprojucerFile)

    set(frutDir "${CMAKE_SOURCE_DIR}/SDKs/FRUT")
    set(jucerBaseFolder "${frutDir}/Jucer2Reprojucer")

    if (APPLE)
        set(${reprojucerFile} "${jucerBaseFolder}/Jucer2Reprojucer" PARENT_SCOPE)
    else ()
        set(${reprojucerFile} "${jucerBaseFolder}/Release/ConsoleApp/Jucer2Reprojucer.exe" PARENT_SCOPE)
    endif ()

endfunction()

function(build_frut frutDir)
    configure_frut(${frutDir})
    build_reprojucer(${frutDir})
endfunction()

function(get_reprojuer_file result)

endfunction()


macro(update_frut)
    set(frutGit "https://github.com/McMartin/FRUT.git")
    set(frutDir "${PROJECT_SOURCE_DIR}/FRUT")

    update_git(${frutGit} "FRUT" "master")
    build_frut(${frutDir})

    list(APPEND CMAKE_MODULE_PATH "${frutDir}/cmake")
    set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} CACHE INTERNAL "")

endmacro()

function(create_cmake jucerFile jucerFilePath)

    set(frutCMake "${frutDir}/Reprojucer.cmake")
    set(frutDir "${PROJECT_SOURCE_DIR}/FRUT")

    set(jucerEXE "Before")
    get_reprojucer_exe(jucerEXE)

    execute_process(COMMAND
            ${jucerEXE}
            ${jucerFile}
            WORKING_DIRECTORY ${jucerFilePath})
endfunction()

function(create_cmake_in_dir targetDir)
    file(GLOB files "${targetDir}/*.jucer")

    foreach (jucerFile ${files})
        create_cmake(${jucerFile} ${targetDir})
    endforeach ()
endfunction()

function(create_cmake_in_subdirs targetDir)
    sub_dir_list(subDirs ${targetDir})

    foreach (subDir ${subDirs})
        set(absoluteSubDir "${targetDir}/${subDir}")
        create_cmake_in_dir(${absoluteSubDir})
    endforeach ()
endfunction()


macro(add_default_jucer_targets)
    jucer_export_target(
            "Xcode (MacOSX)"
    )

    jucer_export_target_configuration(
            "Xcode (MacOSX)"
            NAME "Debug"
            DEBUG_MODE ON
    )

    jucer_export_target_configuration(
            "Xcode (MacOSX)"
            NAME "Release"
            DEBUG_MODE OFF
    )

    jucer_export_target(
            "Visual Studio 2019"
    )

    jucer_export_target_configuration(
            "Visual Studio 2019"
            NAME "Debug"
            DEBUG_MODE ON
    )

    jucer_export_target_configuration(
            "Visual Studio 2019"
            NAME "Release"
            DEBUG_MODE OFF
    )
endmacro()

macro(add_default_jucer_modules)
    jucer_project_module(
            juce_audio_basics
            PATH ${juceModulesDir}
    )

    jucer_project_module(
            juce_audio_devices
            PATH ${juceModulesDir}
            # JUCE_USE_WINRT_MIDI
            # JUCE_ASIO
            # JUCE_WASAPI
            # JUCE_WASAPI_EXCLUSIVE
            # JUCE_DIRECTSOUND
            # JUCE_ALSA
            # JUCE_JACK
            # JUCE_BELA
            # JUCE_USE_ANDROID_OBOE
            # JUCE_USE_ANDROID_OPENSLES
            # JUCE_DISABLE_AUDIO_MIXING_WITH_OTHER_APPS
    )

    jucer_project_module(
            juce_audio_formats
            PATH ${juceModulesDir}
            # JUCE_USE_FLAC
            # JUCE_USE_OGGVORBIS
            # JUCE_USE_MP3AUDIOFORMAT
            # JUCE_USE_LAME_AUDIO_FORMAT
            # JUCE_USE_WINDOWS_MEDIA_FORMAT
    )

    jucer_project_module(
            juce_audio_plugin_client
            PATH ${juceModulesDir}
            JUCE_VST3_CAN_REPLACE_VST2 OFF
            # JUCE_FORCE_USE_LEGACY_PARAM_IDS
            # JUCE_FORCE_LEGACY_PARAMETER_AUTOMATION_TYPE
            # JUCE_USE_STUDIO_ONE_COMPATIBLE_PARAMETERS
            # JUCE_AU_WRAPPERS_SAVE_PROGRAM_STATES
            # JUCE_STANDALONE_FILTER_WINDOW_USE_KIOSK_MODE
    )

    jucer_project_module(
            juce_audio_processors
            PATH ${juceModulesDir}
            # JUCE_PLUGINHOST_VST
            # JUCE_PLUGINHOST_VST3
            # JUCE_PLUGINHOST_AU
            # JUCE_PLUGINHOST_LADSPA
    )

    jucer_project_module(
            juce_audio_utils
            PATH ${juceModulesDir}
            # JUCE_USE_CDREADER
            # JUCE_USE_CDBURNER
    )

    jucer_project_module(
            juce_core
            PATH ${juceModulesDir}
            # JUCE_FORCE_DEBUG
            # JUCE_LOG_ASSERTIONS
            # JUCE_CHECK_MEMORY_LEAKS
            # JUCE_DONT_AUTOLINK_TO_WIN32_LIBRARIES
            # JUCE_INCLUDE_ZLIB_CODE
            # JUCE_USE_CURL
            # JUCE_LOAD_CURL_SYMBOLS_LAZILY
            # JUCE_CATCH_UNHANDLED_EXCEPTIONS
            # JUCE_ALLOW_STATIC_NULL_VARIABLES
            JUCE_STRICT_REFCOUNTEDPOINTER ON
    )

    jucer_project_module(
            juce_data_structures
            PATH ${juceModulesDir}
    )

    jucer_project_module(
            juce_events
            PATH ${juceModulesDir}
            # JUCE_EXECUTE_APP_SUSPEND_ON_BACKGROUND_TASK
    )

    jucer_project_module(
            juce_graphics
            PATH ${juceModulesDir}
            # JUCE_USE_COREIMAGE_LOADER
            # JUCE_USE_DIRECTWRITE
            # JUCE_DISABLE_COREGRAPHICS_FONT_SMOOTHING
    )

    jucer_project_module(
            juce_gui_basics
            PATH ${juceModulesDir}
            # JUCE_ENABLE_REPAINT_DEBUGGING
            # JUCE_USE_XRANDR
            # JUCE_USE_XINERAMA
            # JUCE_USE_XSHM
            # JUCE_USE_XRENDER
            # JUCE_USE_XCURSOR
            # JUCE_WIN_PER_MONITOR_DPI_AWARE
    )

    jucer_project_module(
            juce_gui_extra
            PATH ${juceModulesDir}
            # JUCE_WEB_BROWSER
            # JUCE_ENABLE_LIVE_CONSTANT_EDITOR
    )
endmacro()

macro(set_default_jucer_project_settings)
    jucer_project_settings(
            PROJECT_NAME ${pluginName}
            PROJECT_VERSION "1.0.0"
            REPORT_JUCE_APP_USAGE OFF # Required for closed source applications without an Indie or Pro JUCE license
            DISPLAY_THE_JUCE_SPLASH_SCREEN OFF # Required for closed source applications without an Indie or Pro JUCE license
            PROJECT_TYPE "Audio Plug-in"
            BUNDLE_IDENTIFIER "com.${companyName}.${pluginName}"
            CXX_LANGUAGE_STANDARD "C++14"
    )
endmacro()

macro(set_default_audio_plugin_settings)
    jucer_audio_plugin_settings(
            PLUGIN_FORMATS
            "VST3"
            "AU"
            "Standalone"
            # PLUGIN_CHARACTERISTICS
            PLUGIN_NAME ${pluginName}
            PLUGIN_DESCRIPTION ${pluginName}
            PLUGIN_MANUFACTURER "${companyName}"
            PLUGIN_CHANNEL_CONFIGURATIONS "{1,2}, {2,2}, {0,2}"
            PLUGIN_AAX_IDENTIFIER "com.${companyName}.${pluginName}"
            PLUGIN_AU_EXPORT_PREFIX "${pluginName}AU"
            PLUGIN_AU_MAIN_TYPE "kAudioUnitType_Effect"
            PLUGIN_VST3_CATEGORY "Fx"
            PLUGIN_RTAS_CATEGORY "ePlugInCategory_None"
            PLUGIN_AAX_CATEGORY "AAX_ePlugInCategory_None"
            PLUGIN_VST_LEGACY_CATEGORY "kPlugCategEffect"
    )
endmacro()

macro(create_default_audio_plugin)
    set_default_jucer_project_settings()
    set_default_audio_plugin_settings()
    add_default_jucer_modules()
    add_default_jucer_targets()
endmacro()