@echo off
setlocal

set ERRORCODE=0

set MACHINE=%~1
set CMD=%~2

if exist "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" (
    if exist "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" (
        call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /%MACHINE% /win7 1>NUL 2>NUL
        call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" %MACHINE% 1>NUL 2>NUL
        goto :compilerok
    )
)
if exist "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" (
    if exist "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" (
        call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /%MACHINE% /win7 1>NUL 2>NUL
        call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" %MACHINE% 1>NUL 2>NUL
        goto :compilerok
    )
)
set ERRORCODE=1
goto :end

:compilerok


echo %CMD%
%CMD% || set ERRORCODE=2

:end

endlocal && exit /b %ERRORCODE%
