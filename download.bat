@echo off

cd /d %~dp0

set http_proxy=http://127.0.0.1:1080
set https_proxy=http://127.0.0.1:1080

set DOWNLOAD_DIR=%~dp0\chromium_git
if not exist %DOWNLOAD_DIR% mkdir %DOWNLOAD_DIR%

set DEPOT_TOOLS_DIR=%~dp0\depot_tools
@REM set DEPOT_TOOLS_DIR=D:\Environment\depot_tools
if not exist %DEPOT_TOOLS_DIR% ((mkdir %DEPOT_TOOLS_DIR%) & (7z.exe x -y -o%DEPOT_TOOLS_DIR%  depot_tools.zip))

python automate-git.py --download-dir=%DOWNLOAD_DIR% --depot-tools-dir=%DEPOT_TOOLS_DIR% --no-distrib --no-build