# Go example projects

This repo keeps multiple standalone Go projects in one place. Each top-level project directory owns its own workspace files, helper scripts, local build cache, and README so more examples can be added without mixing their tooling together.

## Project index

| Directory | Description |
| --- | --- |
| [`tutorials/`](./tutorials/) | A self-contained multi-module workspace for the official [Go tutorials](https://go.dev/doc/tutorial/), with per-example READMEs and local `go-local` wrappers. |

Use each project directory as its own Go root and follow the commands in that directory's README. For the tutorial workspace, you can run the local wrapper from the repo root with commands like `.\go-local.cmd run .\getting-started\hello` or `.\tutorials\go-local.cmd run .\getting-started\hello`.
