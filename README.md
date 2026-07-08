# Learning Go

Aligned to: https://go.dev/doc/tutorial/

This repo is now organized as a **multi-module Go workspace**. From the repo root, use the commands in `tutorial\README.md` to run each tutorial program.

If Windows antivirus is interfering with Go builds, use `.\go-local.cmd` instead of calling `go` directly. It keeps Go's temp, cache, module cache, and install output under `.\.local-go\`, which makes the build location project-local and easier to exclude from scanning if needed. `go-local.ps1` is included too, but `go-local.cmd` avoids PowerShell execution-policy issues.
