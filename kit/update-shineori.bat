@echo off
title Shineori SMP mod sync
REM ============================================================
REM  Shineori SMP mod sync (for CurseForge / Vanilla launcher)
REM  Put this file + packwiz-installer-bootstrap.jar in your
REM  instance folder (the one that contains "mods"), then
REM  double-click it before playing.
REM ============================================================
cd /d "%~dp0"

where java >nul 2>nul
if errorlevel 1 (
  echo.
  echo  Java was not found on this PC.
  echo  Install Java 21 from https://adoptium.net then run this again.
  echo.
  pause
  exit /b 1
)

echo Syncing Shineori SMP mods...
java -jar packwiz-installer-bootstrap.jar -g https://shineori.github.io/shineori-pack/pack.toml
if errorlevel 1 (
  echo.
  echo  Sync failed. Screenshot this window and send it to Hasaam.
  pause
  exit /b 1
)
echo.
echo  All synced! Go play :)
timeout /t 5
