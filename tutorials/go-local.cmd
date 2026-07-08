@echo off
setlocal

rem Run Go commands with all writable state kept under .local-go in this project.
rem This keeps caches, temp files, module downloads, and built tools out of the
rem source tree's Go folders, which helps avoid AV noise and keeps local state isolated.
if "%~1"=="" (
    echo Usage: .\go-local.cmd ^<go arguments^> 1>&2
    exit /b 1
)

rem Resolve the project root from the location of this script.
set "REPO_ROOT=%~dp0"
rem Central folder for all machine-local Go state created by this wrapper.
set "LOCAL_GO_ROOT=%REPO_ROOT%.local-go"
rem Go build cache for compiled package artifacts.
set "GOCACHE=%LOCAL_GO_ROOT%\cache"
rem Temporary directory used by the Go toolchain during builds and tests.
set "GOTMPDIR=%LOCAL_GO_ROOT%\tmp"
rem Output directory for installed binaries from `go install`.
set "GOBIN=%LOCAL_GO_ROOT%\bin"
rem Module download cache so dependencies stay local to this repo wrapper.
set "GOMODCACHE=%LOCAL_GO_ROOT%\pkg\mod"

rem Pre-create the directories Go expects so commands can run without setup steps.
mkdir "%LOCAL_GO_ROOT%" 2>nul
mkdir "%GOCACHE%" 2>nul
mkdir "%GOTMPDIR%" 2>nul
mkdir "%GOBIN%" 2>nul
mkdir "%GOMODCACHE%" 2>nul

rem Run from the script directory so relative Go workspace paths work from any caller location.
pushd "%REPO_ROOT%"

rem Forward all original arguments to the real Go CLI with the local env in place.
go %*
set "GO_EXIT=%ERRORLEVEL%"
popd
exit /b %GO_EXIT%
