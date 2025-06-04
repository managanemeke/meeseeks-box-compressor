@echo off

set path=%~d0%~p0

:start

"%path%pngquant.exe" --force --verbose 256 %1