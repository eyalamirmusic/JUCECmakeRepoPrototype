#include "StandaloneFilter.h"
#include "ConfigurationHelpers.h"

StandaloneFilterApp::StandaloneFilterApp()
{
    PluginHostType::jucePlugInClientCurrentWrapperType =
        AudioProcessor::wrapperType_Standalone;

    appProperties.setStorageParameters(PropertiesFileOptions());
}

StandaloneFilterWindow* StandaloneFilterApp::createWindow()
{
    return new StandaloneFilterWindow(getApplicationName(),
                                      Helpers::getBackgroundColor(),
                                      appProperties.getUserSettings(),
                                      false,
                                      {},
                                      nullptr,
                                      Helpers::getChannelConfigurations(),
                                      Helpers::shouldAutoOpenMidiDevices());
}

void StandaloneFilterApp::initialise(const String&)
{
    mainWindow.reset(createWindow());

    if (!Helpers::shouldUseKioskMode())
        mainWindow->setVisible(true);
}

void StandaloneFilterApp::shutdown()
{
    mainWindow = nullptr;
    appProperties.saveIfNeeded();
}

void StandaloneFilterApp::systemRequestedQuit()
{
    if (mainWindow != nullptr)
        mainWindow->pluginHolder->savePluginState();

    if (ModalComponentManager::getInstance()->cancelAllModalComponents())
        Timer::callAfterDelay(100, [&]() { requestQuit(); });
    else
        quit();
}

void StandaloneFilterApp::requestQuit() const
{
    if (auto app = getInstance())
        app->systemRequestedQuit();
}


JUCEApplicationBase* juce_CreateApplication()
{
    return new StandaloneFilterApp();
}