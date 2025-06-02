@Echo Off
Setlocal
color 0a
set "Source=%~dp0..\substrates_uncompressed"
set "Destination=%~dp0..\substrates"
cd /d "%Source%"
if not exist ".\*.png" (
  echo.
  echo FAILED! Files *.png not found. 
  echo.
 pause
 endlocal & exit
) else (
    echo.
  echo   Lossy compress all PNG in a Directory:
  echo   %Source%
if not exist %Destination% mkdir %Destination%
for %%i in (*.png) do (
"%~dp0pngquant.exe" --strip "%%i" -o "%Destination%\%%~ni.png" && (Echo "%%i" - OK& Rem.) || Echo === "%%i" - FAILED!
)
  )
    echo.
    echo Process done!
    echo.
 pause
endlocal & exit
