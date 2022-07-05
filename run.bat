@echo off
    g++ -std=c++17 -O2 %1.cpp -o %~dpn1.exe -Wshadow -Wall -Wextra  -Wl,--stack=268435456
    %~dpn1.exe