@echo off

cd /d %~dp0

set http_proxy=http://127.0.0.1:1080
set https_proxy=http://127.0.0.1:1080

set DOWNLOAD_DIR=%~dp0\chromium_git
if not exist %DOWNLOAD_DIR% (mkdir %DOWNLOAD_DIR%)

set DEPOT_TOOLS_DIR=%~dp0\depot_tools
if not exist %DEPOT_TOOLS_DIR% (git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git)

del /F /Q automate-git.py
wget https://bitbucket.org/chromiumembedded/cef/raw/master/tools/automate/automate-git.py

python automate-git.py --download-dir=%DOWNLOAD_DIR% --depot-tools-dir=%DEPOT_TOOLS_DIR% --no-distrib --no-build