# Command

From this directory:

```powershell
..\go-local.cmd run .\call-module-code
```

[Tutorial: Call module code](https://go.dev/doc/tutorial/call-module-code)

## Note

Pay attention to the `require` and `replace` directives. Local modules do not get checksums, which is fine because the dependency is resolved from the local workspace.