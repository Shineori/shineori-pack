@echo off
REM ============================================================
REM  Shineori SMP pre-launch hook for the Modrinth App.
REM  Put in the instance folder, then set the instance's
REM  Pre-launch hook to (copy exactly):
REM    cmd /c set NoDefaultCurrentDirectoryInExePath=& modrinth-hook.bat
REM  No pauses here on purpose, so launching never gets stuck.
REM ============================================================
cd /d "%~dp0"
set "PACK=https://shineori.github.io/shineori-pack/pack.toml"
set "JAVA="

REM 1) The Java this instance launches with (Modrinth passes it in)
if defined INST_JAVA set "JAVA=%INST_JAVA%"

REM 2) Java on PATH
if not defined JAVA (
  where java >nul 2>nul && set "JAVA=java"
)

REM 3) Any Java the Modrinth App already downloaded (newest wins)
if not defined JAVA (
  for /f "delims=" %%J in ('dir /b /s /o:n "%APPDATA%\ModrinthApp\meta\java_versions\java.exe" 2^>nul') do set "JAVA=%%J"
)

if not defined JAVA (
  echo No Java found. Launch any vanilla 26.3 profile once in Modrinth, then try again.
  exit /b 1
)

"%JAVA%" -jar packwiz-installer-bootstrap.jar "%PACK%"
exit /b %errorlevel%
