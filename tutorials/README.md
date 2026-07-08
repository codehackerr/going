# Go tutorials

Implementations of the official [Go tutorials](https://go.dev/doc/tutorial/) collected as one self-contained project under `tutorials\`.

Docker support is included for cases where you want a repeatable Go toolchain without relying on the host machine setup. The image builds from this `tutorials\` directory, exposes the same tutorial commands through its entrypoint, and can also bind mount your working tree when you want to verify local changes inside the container.

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

## Docker

Build the workspace image from `tutorials\` so `docker-entrypoint.sh` is copied to `/workspace/docker-entrypoint.sh`:

```powershell
cd C:\Users\asala\Repos\going\tutorials
docker build -t going-tutorials .
```

### Run examples

Run each tutorial module through the image entrypoint:

```powershell
docker run --rm going-tutorials run ./getting-started/hello
docker run --rm going-tutorials run ./call-module-code
docker run --rm going-tutorials run ./random-greeting/hello
docker run --rm going-tutorials run ./greetings-multiple-people/hello
docker run --rm going-tutorials test ./add-a-test/greetings
docker run --rm going-tutorials version
```

`.\create-module\greetings` is still a library module, so verify it through `.\call-module-code` rather than trying to run it directly.

`.\handle-errors\hello` is intentionally an error-handling example and ends with `log.Fatal`, so it exits non-zero:

```powershell
docker run --rm going-tutorials run ./handle-errors/hello
```

### Verify examples

Verify the successful examples individually:

```powershell
docker run --rm going-tutorials test ./add-a-test/greetings
docker run --rm going-tutorials run ./getting-started/hello
docker run --rm going-tutorials run ./call-module-code
docker run --rm going-tutorials run ./random-greeting/hello
docker run --rm going-tutorials run ./greetings-multiple-people/hello
```

Verify the whole workspace with the bundled script:

```powershell
docker run --rm going-tutorials verify
```

The image uses the same project-local writable Go directories as `go-local.cmd`, but inside the container under `/workspace/.local-go`, so temp files and caches stay out of OS-managed temp paths.

To verify your current checkout instead of the files baked into the image, bind mount this directory:

```powershell
docker run --rm -v "${PWD}:/workspace" going-tutorials verify
```
