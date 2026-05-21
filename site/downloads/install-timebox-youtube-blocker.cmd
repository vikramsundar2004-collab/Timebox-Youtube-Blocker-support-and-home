@echo off
setlocal
title Install Timebox YouTube Blocker

set "TIMEBOX_ZIP_URL=https://raw.githubusercontent.com/vikramsundar2004-collab/Timebox-Youtube-Blocker-support-and-home/main/site/downloads/timebox-youtube-blocker.zip"
set "TIMEBOX_FALLBACK_ZIP_URL=https://raw.githubusercontent.com/vikramsundar2004-collab/Timebox-Youtube-Blocker-support-and-home/main/site/downloads/timebox-youtube-blocker.zip"
set "TIMEBOX_INSTALL_ROOT=%LOCALAPPDATA%\TimeboxYouTubeBlocker"
set "TIMEBOX_ZIP_PATH=%TEMP%\timebox-youtube-blocker.zip"

echo Timebox YouTube Blocker installer
echo.
echo This helper downloads and extracts the extension, then opens Chrome's extension page.
echo Chrome still requires you to click "Load unpacked" and select the extracted folder.
echo.

powershell -NoProfile -Command ^
  "$ErrorActionPreference='Stop';" ^
  "$ProgressPreference='SilentlyContinue';" ^
  "$zipUrl=$env:TIMEBOX_ZIP_URL;" ^
  "$fallbackZipUrl=$env:TIMEBOX_FALLBACK_ZIP_URL;" ^
  "$zipPath=$env:TIMEBOX_ZIP_PATH;" ^
  "$installRoot=$env:TIMEBOX_INSTALL_ROOT;" ^
  "Write-Host 'Downloading extension package...';" ^
  "try { Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath } catch { Write-Host 'Primary download failed. Trying backup download...'; Invoke-WebRequest -Uri $fallbackZipUrl -OutFile $zipPath };" ^
  "if (Test-Path $installRoot) { Remove-Item -LiteralPath $installRoot -Recurse -Force };" ^
  "New-Item -ItemType Directory -Force -Path $installRoot | Out-Null;" ^
  "Write-Host 'Extracting extension files...';" ^
  "Expand-Archive -LiteralPath $zipPath -DestinationPath $installRoot -Force;" ^
  "Write-Host 'Extension files installed successfully.';"

if errorlevel 1 (
  echo.
  echo Install failed. Please try the manual ZIP install from the download page.
  echo.
  if "%TIMEBOX_INSTALLER_SKIP_PAUSE%"=="1" exit /b 1
  pause
  exit /b 1
)

if "%TIMEBOX_INSTALLER_SKIP_OPEN%"=="1" (
  echo Skipping auto-open because TIMEBOX_INSTALLER_SKIP_OPEN=1.
) else (
  call :open_chrome_extensions
  start "" "%TIMEBOX_INSTALL_ROOT%"
)

echo.
echo NEXT STEPS:
echo 1. In Chrome, turn on Developer mode in the top-right.
echo 2. Click Load unpacked.
echo 3. Select this folder:
echo %TIMEBOX_INSTALL_ROOT%
echo 4. Open youtube.com to test the blocker.
echo.
echo Keep this window open until Chrome and the extension folder are open.
echo.
if "%TIMEBOX_INSTALLER_SKIP_PAUSE%"=="1" exit /b 0
pause
exit /b 0

:open_chrome_extensions
set "CHROME_EXE=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%CHROME_EXE%" (
  start "" "%CHROME_EXE%" "chrome://extensions"
  exit /b 0
)

set "CHROME_EXE=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%CHROME_EXE%" (
  start "" "%CHROME_EXE%" "chrome://extensions"
  exit /b 0
)

start "" "chrome://extensions"
exit /b 0
