@ECHO OFF

SET path=%~dp0

CALL :compress_png_file_with_suffix %1, "compressed"

EXIT /B %ERRORLEVEL%

:compress_png_file_with_suffix
SET input=%~1
SET without_extension=%input:~0,-4%
SET output=%without_extension%_%~2.png
CALL :compress_png_file "%input%", "%output%"
EXIT /B 0

:compress_png_file
SET input=%~1
SET output=%~2
"%path%pngquant.exe" --force --strip "%input%" -o "%output%"
EXIT /B 0
