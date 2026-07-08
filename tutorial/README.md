# Go getting started

Implementations of Go tutorials in respective subdirectories.

[Getting Started](https://go.dev/doc/tutorial)

## Workspace layout

The repo root contains a `go.work` file so the tutorial modules can be used together as one multi-module project.

## Project-local Go output

If antivirus is interfering with builds, run the repo's `.\go-local.cmd` wrapper from the repo root. It moves Go's temp files, build cache, module cache, and install output into `.\.local-go\` inside this project. `go-local.ps1` is also available if you prefer PowerShell and allow local scripts.

## Run from the repo root

```powershell
.\go-local.cmd run .\tutorial\getting-started\hello
.\go-local.cmd run .\tutorial\call-module-code
.\go-local.cmd run .\tutorial\random-greeting\hello
.\go-local.cmd run .\tutorial\greetings-multiple-people\hello
.\go-local.cmd run .\tutorial\handle-errors\hello
.\go-local.cmd test .\tutorial\add-a-test\greetings
```

`tutorial\create-module\greetings` is a library module, so it is consumed by `tutorial\call-module-code` rather than run directly.
