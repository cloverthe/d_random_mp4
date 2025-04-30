@echo off
set SRC=run.d
set RES=run.res
set ICO=run.ico
set RC=run.rc
set EXE=run.exe

echo [*] Compiling icon resource...
windres %RC% -O coff -o %RES%

echo [*] Compiling D program...
dmd -O -release -inline %SRC% %RES% -L/subsystem:windows

echo [✓] Done: %EXE%
pause
