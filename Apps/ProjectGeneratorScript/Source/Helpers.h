#pragma once

constexpr bool isMac()
{
#if JUCE_MAC
    return true;
#else
    return false;
#endif
}

class LoopingThread : public Thread
{
public:
    LoopingThread(int frequencyInMs = 1000, const String& name = "Worker Thread")
        : Thread(name)
        , freq(frequencyInMs)
    {
        startThread();
    }

    ~LoopingThread() override
    {
        shouldRun.store(false);
        GenericScopedLock<SpinLock> sl(lock);
        stopThread(0);
    }

    std::function<void()> callback;

private:
    void run() override
    {
        while (shouldRun.load())
        {
            GenericScopedLock<SpinLock> sl(lock);

            if (callback)
                callback();

            sleep(freq);
        }
    }

    int freq = 1000;
    std::atomic<bool> shouldRun {true};
    SpinLock lock;
};

struct WaitingDots
{
    WaitingDots()
    {
        loop.callback = [] { std::cout << "."; };
    }

    LoopingThread loop {500};
};

class CommandRunner
{
public:
    explicit CommandRunner(const String& command)
    {
        Logger::writeToLog("Running " + command);

        p.start(command);
        while (p.isRunning()) {}

        Logger::writeToLog(p.readAllProcessOutput());
    }

private:

    ChildProcess p;
    WaitingDots d;
};

void runCommand(const String& command)
{
    CommandRunner c (command);
}
