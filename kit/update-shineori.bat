@echo off
title Shineori SMP mod sync
REM ============================================================
REM  Shineori SMP mod sync (for CurseForge / Vanilla launcher)
REM  Put this file + packwiz-installer-bootstrap.jar in your
REM  instance folder (the one that contains "mods"), then
REM  double-click it before playing.
REM ============================================================
cd /d "%~dp0"
set "PACK=https://shineori.github.io/shineori-pack/pack.toml"
set "JAVA="

REM 1) Java on PATH
where java >nul 2>nul && set "JAVA=java"

REM 2) Java bundled with CurseForge / Vanilla / Modrinth launchers
if not defined JAVA for /f "delims=" %%J in ('dir /b /s /o:n "%USERPROFILE%\curseforge\minecraft\Install\runtime\java.exe" 2^>nul') do set "JAVA=%%J"
if not defined JAVA for /f "delims=" %%J in ('dir /b /s /o:n "%APPDATA%\.minecraft\runtime\java.exe" 2^>nul') do set "JAVA=%%J"
if not defined JAVA for /f "delims=" %%J in ('dir /b /s /o:n "%LOCALAPPDATA%\Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\runtime\java.exe" 2^>nul') do set "JAVA=%%J"
if not defined JAVA for /f "delims=" %%J in ('dir /b /s /o:n "%APPDATA%\ModrinthApp\meta\java_versions\java.exe" 2^>nul') do set "JAVA=%%J"

if not defined JAVA (
  echo.
  echo  Couldn't find Java. Launch Minecraft once from your launcher,
  echo  or install Java 21+ from https://adoptium.net, then run this again.
  echo.
  pause
  exit /b 1
)

echo Syncing Shineori SMP mods...
"%JAVA%" -jar packwiz-installer-bootstrap.jar "%PACK%"
if errorlevel 1 (
  echo.
  echo  Sync failed. Screenshot this window and send it to Hasaam.
  pause
  exit /b 1
)
echo.
echo  All synced! Go play :)
timeout /t 5
