# Command

From this directory:

```powershell
..\..\go-local.cmd run .\random-greeting\hello
```

## Note

Pay attention to the `require` and `replace` directives. Local modules do not get checksums, which is fine because the dependency is resolved from the local workspace.