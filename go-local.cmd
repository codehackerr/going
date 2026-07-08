@echo off
setlocal

if "%~1"=="" (
    echo Usage: .\go-local.cmd ^<go arguments^> 1>&2
    exit /b 1
)

rem Forward to the tutorials workspace wrapper so repo-root commands use the
rem multi-module go.work file under tutorials\.
set "REPO_ROOT=%~dp0"
pushd "%REPO_ROOT%tutorials"
call ".\go-local.cmd" %*
set "GO_EXIT=%ERRORLEVEL%"
popd
exit /b %GO_EXIT%
