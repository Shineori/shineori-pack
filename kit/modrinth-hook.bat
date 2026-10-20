@echo off
REM ============================================================
REM  Shineori SMP pre-launch hook for the Modrinth App.
REM  Put in the instance folder, then set the instance's
REM  Pre-launch hook to:   cmd /c modrinth-hook.bat
REM  No pauses here on purpose, so launching never gets stuck.
REM ============================================================
cd /d "%~dp0"
set "PACK=https://shineori.github.io/shineori-pack/pack.toml"
set "JAVA="

REM 1) Java on PATH, if the player has one
where java >nul 2>nul && set "JAVA=java"

REM 2) Otherwise use a Java the Modrinth App already downloaded (newest wins)
if not defined JAVA (
  for /f "delims=" %%J in ('dir /b /s /o:n "%APPDATA%\ModrinthApp\meta\java_versions\java.exe" 2^>nul') do set "JAVA=%%J"
)

if not defined JAVA (
  echo No Java found. Launch any vanilla 26.3 profile once in Modrinth, then try again.
  exit /b 1
)

"%JAVA%" -jar packwiz-installer-bootstrap.jar -g "%PACK%"
exit /b %errorlevel%
