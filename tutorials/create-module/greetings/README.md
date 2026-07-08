This is a library module, not a `main` package, so it is not run directly.

Use a consumer program instead:

```powershell
..\..\go-local.cmd run .\call-module-code
```

Run that command from this directory.

If you want automated verification for a library module, add tests as shown in `..\..\add-a-test\greetings`.