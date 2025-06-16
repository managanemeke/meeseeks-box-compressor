@ECHO OFF
CHCP 65001
SETLOCAL EnableDelayedExpansion

SET path=%~dp0

CALL :compress_file_with_suffix %1, "compressed"

EXIT /B %ERRORLEVEL%

:compress_file_with_suffix
SET input=%~1
SET without_extension=%~dpn1
CALL :get_extension_without_dot "%input%" extension
SET output=%without_extension%_%~2.%extension%
CALL :compress_file "%input%", "%output%"
EXIT /B 0

:compress_file
SET input=%~1
SET output=%~2
CALL :get_extension_without_dot "%input%" extension
IF "%extension%"=="png" CALL :compress_png_file "%input%", "%output%"
IF "%extension%"=="jpg" CALL :compress_jpg_file "%input%", "%output%"
IF "%extension%"=="jpeg" CALL :compress_jpg_file "%input%", "%output%"
IF "%extension%"=="PNG" CALL :compress_png_file "%input%", "%output%"
IF "%extension%"=="JPG" CALL :compress_jpg_file "%input%", "%output%"
IF "%extension%"=="JPEG" CALL :compress_jpg_file "%input%", "%output%"
EXIT /B 0

:compress_png_file
SET input=%~1
SET output=%~2
"%path%pngquant.exe" --force --strip "%input%" -o "%output%"
EXIT /B 0

:compress_jpg_file
SET input=%~1
SET output=%~2
"%path%jpegoptim.exe" "%input%" --strip-all --overwrite --max=60 --stdout > "%output%"
EXIT /B 0

:get_extension_without_dot
SET extension=%~x1
SET without_dot=%extension:~1%
SET %~2=%without_dot%
EXIT /B 0
