# JUCECmakeRepoPrototype
A prototype to model a way to create an entire repo using JUCE 6 and CMake.

The main concept is to set all the different variables (where JUCE is, custom modules, etc) in the top CMakeLists.txt, then add all your projects with very little setup time.

To build this, all you have to do is load this project in your favorite IDE (CLion/Visual Studio/Visual Studio Code) and click 'build' on one of the targets (templates, JUCE examples, Projucer, etc).

You can also generate a project for an IDE by doing:
CMake -G Xcode -S . -B build 

JUCE 6 just came out and is in testing stages, so feel free to report any bugs!

Important note:
The purpose of this repo is to provide an example when just starting out with CMake in JUCE.
I made it, since this way is similar to how I would like my repos to be set up, so I can start by copy/paste some parts of the this repo and get set up quickly.
