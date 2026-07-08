param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$GoArgs
)

# Run Go commands with all writable state kept under .local-go in this repo.
# This keeps caches, temp files, module downloads, and built tools out of the
# source tree's Go folders, which helps avoid AV noise and keeps local state isolated.
if (-not $GoArgs -or $GoArgs.Count -eq 0) {
    Write-Error "Usage: .\go-local.ps1 <go arguments>"
    exit 1
}

# Resolve the repository root from the location of this script.
$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
# Central folder for all machine-local Go state created by this wrapper.
$localGoRoot = Join-Path $repoRoot ".local-go"

# Go build cache for compiled package artifacts.
$env:GOCACHE = Join-Path $localGoRoot "cache"
# Temporary directory used by the Go toolchain during builds and tests.
$env:GOTMPDIR = Join-Path $localGoRoot "tmp"
# Output directory for installed binaries from `go install`.
$env:GOBIN = Join-Path $localGoRoot "bin"
# Module download cache so dependencies stay local to this repo wrapper.
$env:GOMODCACHE = Join-Path $localGoRoot "pkg\mod"

# Pre-create the directories Go expects so commands can run without setup steps.
foreach ($path in @($localGoRoot, $env:GOCACHE, $env:GOTMPDIR, $env:GOBIN, $env:GOMODCACHE)) {
    if (-not (Test-Path -LiteralPath $path)) {
        New-Item -ItemType Directory -Path $path | Out-Null
    }
}

# Forward all original arguments to the real Go CLI with the local env in place.
& go @GoArgs
exit $LASTEXITCODE
