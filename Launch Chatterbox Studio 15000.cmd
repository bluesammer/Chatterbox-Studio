@echo off
setlocal
if not defined STUDIO_PYTHON set "STUDIO_PYTHON=%~dp0.venv\Scripts\python.exe"
if not exist "%STUDIO_PYTHON%" set "STUDIO_PYTHON=%~dp0..\..\work\chatterbox-venv\Scripts\python.exe"
set "STUDIO_SOURCE=%~dp0"
if not exist "%STUDIO_PYTHON%" (
    echo The separate Chatterbox Studio Python environment was not found.
    pause
    exit /b 1
)
if not defined CHATTERBOX_MODEL_CACHE if not exist "%STUDIO_SOURCE%\system_models_cache\models--ResembleAI--chatterbox" (
    set "CHATTERBOX_MODEL_CACHE=%LOCALAPPDATA%\LuciarkLabs\Chatterbox Studio\system_models_cache"
)
if defined CHATTERBOX_MODEL_CACHE if not exist "%CHATTERBOX_MODEL_CACHE%\" (
    echo The installed Chatterbox Studio model cache could not be opened.
    echo Check that Chatterbox Studio is installed for this Windows account.
    pause
    exit /b 1
)
cd /d "%STUDIO_SOURCE%"
"%STUDIO_PYTHON%" main.py
if errorlevel 1 pause

