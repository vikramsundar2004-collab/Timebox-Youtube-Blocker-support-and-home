@echo off
setlocal
title Install Timebox YouTube Blocker

echo Timebox YouTube Blocker installer
echo.
echo This helper downloads and extracts the extension, then opens Chrome's extension page.
echo Chrome still requires you to click "Load unpacked" and select the extracted folder.
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop';" ^
  "$zipUrl='https://raw.githubusercontent.com/vikramsundar2004-collab/Timebox-Youtube-Blocker-support-and-home/main/site/downloads/timebox-youtube-blocker.zip';" ^
  "$installRoot=Join-Path $env:LOCALAPPDATA 'TimeboxYouTubeBlocker';" ^
  "$zipPath=Join-Path $env:TEMP 'timebox-youtube-blocker.zip';" ^
  "Write-Host 'Downloading extension package...';" ^
  "Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath;" ^
  "if (Test-Path $installRoot) { Remove-Item -LiteralPath $installRoot -Recurse -Force };" ^
  "New-Item -ItemType Directory -Force -Path $installRoot | Out-Null;" ^
  "Write-Host 'Extracting extension files...';" ^
  "Expand-Archive -LiteralPath $zipPath -DestinationPath $installRoot -Force;" ^
  "$chromeCandidates=@(\"$env:ProgramFiles\Google\Chrome\Application\chrome.exe\", \"${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe\");" ^
  "$chrome=$chromeCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1;" ^
  "if ($chrome) { Start-Process -FilePath $chrome -ArgumentList 'chrome://extensions' } else { Start-Process 'chrome://extensions' };" ^
  "Start-Process explorer.exe $installRoot;" ^
  "Write-Host '';" ^
  "Write-Host 'NEXT STEPS:';" ^
  "Write-Host '1. In Chrome, turn on Developer mode in the top-right.';" ^
  "Write-Host '2. Click Load unpacked.';" ^
  "Write-Host '3. Select this folder:';" ^
  "Write-Host $installRoot;" ^
  "Write-Host '4. Open youtube.com to test the blocker.';"

echo.
echo Keep this window open until Chrome and the extension folder are open.
echo.
pause
