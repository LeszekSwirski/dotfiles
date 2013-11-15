@echo off

set THIS_DIR=%~dp0
set YCM_DIR=%CD%
set BUILD_DIR=%TEMP%\ycm-build

call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" x86 1>NUL 2>NUL || goto :fail
mkdir %BUILD_DIR%
cd %BUILD_DIR%
cmake -G "Visual Studio 11" %YCM_DIR%\cpp || goto :fail
msbuild /t:ycm_core;ycm_client_support /property:configuration=Release YouCompleteMe.sln || goto :fail

cd %YCM_DIR%\python
move ycm_core.pyd ycm_core.pyd.old.%RANDOM%
move ycm_client_support.pyd ycm_client_support.pyd.old.%RANDOM%
robocopy %BUILD_DIR%\ycm\Release %YCM_DIR%\python ycm_core.pyd ycm_client_support.pyd
del *.pyd.old.*

exit 0
goto :eof

:fail
pause
exit 1
