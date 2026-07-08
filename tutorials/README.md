# Go tutorials

Implementations of the official [Go tutorials](https://go.dev/doc/tutorial/) collected as one self-contained project under `tutorials\`.

## Example index

| Directory | Description |
| --- | --- |
| `getting-started\` | First `hello` program and basic module setup. |
| `create-module\` | A reusable `greetings` library module. |
| `call-module-code\` | A small program that consumes the `create-module` library. |
| `random-greeting\` | A greeting library and app with randomized messages. |
| `greetings-multiple-people\` | Greeting multiple names in one call. |
| `handle-errors\` | Returning and handling errors from a greeting module. |
| `add-a-test\` | Unit tests for the greetings package. |

## Workspace layout

This directory contains its own `go.work` file so the tutorial modules can be developed together as one multi-module workspace.

## Project-local Go output

If antivirus interferes with builds, run `.\go-local.cmd` from this directory instead of calling `go` directly. It keeps temp files, caches, module downloads, and installed binaries under `.\.local-go\` inside `tutorials\`. `go-local.ps1` is included too if you prefer PowerShell and allow local scripts.

## Run from `tutorials\`

```powershell
.\go-local.cmd run .\getting-started\hello
.\go-local.cmd run .\call-module-code
.\go-local.cmd run .\random-greeting\hello
.\go-local.cmd run .\greetings-multiple-people\hello
.\go-local.cmd run .\handle-errors\hello
.\go-local.cmd test .\add-a-test\greetings
```

`.\create-module\greetings` is a library module, so it is consumed by `.\call-module-code` rather than run directly.
