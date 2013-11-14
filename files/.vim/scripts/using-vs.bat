@echo off

if exist "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" (
    if exist "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" (
        call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /x86 /win7 1>NUL 2>NUL
        call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86 1>NUL 2>NUL
        goto :compilerok
    )
)
if exist "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" (
    if exist "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" (
        call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /x86 /win7 1>NUL 2>NUL
        call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" x86 1>NUL 2>NUL
        goto :compilerok
    )
)
goto :fail

:compilerok

set CMD=%~1

echo %CMD%
%CMD% || goto :compilefail

goto :eof

:fail
echo Couldn't find compiler
exit 1
goto :eof

:compilefail
echo Failed to compile
exit 2
goto :eof
