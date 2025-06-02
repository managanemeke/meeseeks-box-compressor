@Echo Off
Setlocal
color 0a
set "Source=%~dp0..\substrates_uncompressed"
set "Destination=%~dp0..\substrates"
cd /d "%Source%"
if not exist ".\*.jpg" (
  echo.
  echo FAILED! Files *.jpg not found.
  echo.
 pause
 endlocal & exit
) else (
    echo.
  echo   Lossy compress all jpg in a Directory:
  echo   %Source%
if not exist %Destination% mkdir %Destination%
for %%i in (*.jpg) do (
"%~dp0jpegoptim.exe" -m60 --strip-all "%%i" --dest="%Destination%" && (Echo "%%i" - OK& Rem.) || Echo === "%%i" - FAILED!
)
  )
    echo.
    echo Process done!
    echo.
 pause
endlocal & exit
