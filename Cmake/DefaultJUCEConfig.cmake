macro(add_jucer_target targetName)
    jucer_export_target(${targetName})
    jucer_export_target_configuration(${targetName} NAME "Debug" DEBUG_MODE ON)
    jucer_export_target_configuration(${targetName} NAME "Release" DEBUG_MODE OFF)
endmacro()

macro(add_jucer_mac_target)
    add_jucer_target("Xcode (MacOSX)")
endmacro()

macro(add_jucer_windows_target)
    add_jucer_target("Visual Studio 2019")
endmacro()

macro(add_jucer_linux_target)
    add_jucer_target("Linux Makefile")
endmacro()

macro(add_jucer_ios_target)
    add_jucer_target("Xcode (iOS)")
endmacro()

macro(add_all_jucer_targets)
    add_jucer_target("Xcode (MacOSX)")
    add_jucer_target("Visual Studio 2019")
    add_jucer_target("Linux Makefile")
    add_jucer_target("Xcode (iOS)")
endmacro()

macro(add_juce_audio_basics)
    jucer_project_module(
            juce_audio_basics
            PATH ${juceModulesDir})
endmacro()

macro(add_juce_audio_devices)
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
endmacro()

macro(add_juce_audio_formats)
    jucer_project_module(
            juce_audio_formats
            PATH ${juceModulesDir}
            # JUCE_USE_FLAC
            # JUCE_USE_OGGVORBIS
            # JUCE_USE_MP3AUDIOFORMAT
            # JUCE_USE_LAME_AUDIO_FORMAT
            # JUCE_USE_WINDOWS_MEDIA_FORMAT
    )
endmacro()

macro(add_juce_audio_plugin_client)
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
endmacro()

macro(add_juce_audio_processors)
    jucer_project_module(
            juce_audio_processors
            PATH ${juceModulesDir}
            # JUCE_PLUGINHOST_VST
            # JUCE_PLUGINHOST_VST3
            # JUCE_PLUGINHOST_AU
            # JUCE_PLUGINHOST_LADSPA
    )
endmacro()

macro(add_juce_audio_utils)
    jucer_project_module(
            juce_audio_utils
            PATH ${juceModulesDir}
            # JUCE_USE_CDREADER
            # JUCE_USE_CDBURNER
    )
endmacro()

macro(add_juce_core)
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
endmacro()

macro(add_juce_data_structures)
    jucer_project_module(
            juce_data_structures
            PATH ${juceModulesDir}
    )
endmacro()

macro(add_juce_events)
    jucer_project_module(
            juce_events
            PATH ${juceModulesDir}
            # JUCE_EXECUTE_APP_SUSPEND_ON_BACKGROUND_TASK
    )
endmacro()

macro(add_juce_graphics)
    jucer_project_module(
            juce_graphics
            PATH ${juceModulesDir}
            # JUCE_USE_COREIMAGE_LOADER
            # JUCE_USE_DIRECTWRITE
            # JUCE_DISABLE_COREGRAPHICS_FONT_SMOOTHING
    )
endmacro()

macro(add_juce_gui_basics)
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

endmacro()

macro(add_juce_gui_extra)
    jucer_project_module(
            juce_gui_extra
            PATH ${juceModulesDir}
            # JUCE_WEB_BROWSER
            # JUCE_ENABLE_LIVE_CONSTANT_EDITOR
    )
endmacro()

macro(add_custom_module moduleName moduleDir)
    jucer_project_module(${moduleName} PATH ${moduleDir})
endmacro()

macro(set_default_jucer_project_settings appType)
    jucer_project_settings(
            PROJECT_NAME ${pluginName}
            PROJECT_VERSION "1.0.0"
            REPORT_JUCE_APP_USAGE OFF # Required for closed source applications without an Indie or Pro JUCE license
            DISPLAY_THE_JUCE_SPLASH_SCREEN OFF # Required for closed source applications without an Indie or Pro JUCE license
            PROJECT_TYPE ${appType}
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