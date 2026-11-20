@echo off
REM Accurova Rhenium: double-click to open the editor (rhenium.accurova.com) in your browser.
REM The editing runs here, on this device; close this window to stop it. Offline: studio.bat --local
REM First time on a laptop: double-click polaroid-reel\setup.bat (installs Python + packages).
title Accurova Rhenium
set "PY=python"
if exist "%USERPROFILE%\.polaroid-reel\venv\Scripts\python.exe" set "PY=%USERPROFILE%\.polaroid-reel\venv\Scripts\python.exe"
"%PY%" "%~dp0studio.py" %*
if errorlevel 1 (
  echo.
  echo The studio stopped with an error. If Python or a package is missing, run polaroid-reel\setup.bat first.
  pause
)
