@echo off

cd /d %~dp0

set http_proxy=http://127.0.0.1:1080
set https_proxy=http://127.0.0.1:1080

set DOWNLOAD_DIR=%~dp0\chromium_git
@REM set DEPOT_TOOLS_DIR=%~dp0\depot_tools
set DEPOT_TOOLS_DIR=D:\Environment\depot_tools

if not exist %DOWNLOAD_DIR% mkdir chromium_git 
@REM if not exist %DEPOT_TOOLS_DIR% 7z.exe x depot_tools.7z

python automate-git.py --download-dir=%DOWNLOAD_DIR% --depot-tools-dir=%DEPOT_TOOLS_DIR% --no-distrib --no-build