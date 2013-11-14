@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" x86 1>NUL 2>NUL || goto :fail
mkdir build
cd build
cmake -G "Visual Studio 11" ..\cpp || goto :fail
msbuild /t:ycm_core;ycm_client_support /property:configuration=Release YouCompleteMe.sln || goto :fail
cd ..
copy build\ycm\Release\ycm_core.pyd python || goto :fail
copy build\ycm\Release\ycm_client_support.pyd python || goto :fail

exit 0

:fail

pause
exit 1
