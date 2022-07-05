@echo off
    g++ -std=c++17 -O2 %1.cpp -o solution -Wshadow -Wall -Wextra  -Wl,--stack=268435456
    g++ -std=c++17 -O2 %2.cpp -o brute -Wshadow -Wall -Wextra  -Wl,--stack=268435456
    g++ -std=c++17 -O2 %3.cpp -o gen -Wshadow -Wall -Wextra  -Wl,--stack=268435456

if [%4] == [] (set /A n = 100) else (set /A n = %4)

set "WA="

for /l %%x in (1, 1, %n%) do (
    gen > input.txt
    solution < input.txt > solve.txt
    brute < input.txt > brute.txt

    fc solve.txt brute.txt > diagnostics
    if errorlevel 1 (
        echo #%%x WA
        set "WA=1"
        echo WA on the following test:
        type input.txt
        echo.
        echo Your answer is:
        type solve.txt
        echo.
        echo Correct answer is:
        type brute.txt
        echo.
    ) else echo #%%x AC
)

if defined WA (
    echo There're still WA
) else (
    echo All tests passed
)

del gen.exe
del solution.exe
del brute.exe
del input.txt
del solve.txt
del brute.txt
del diagnostics