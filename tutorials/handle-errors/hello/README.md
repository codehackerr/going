# Command

From this directory:

```powershell
..\..\go-local.cmd run .\handle-errors\hello
```

[Tutorial: Handle errors](https://go.dev/doc/tutorial/handle-errors)

## Note: 

Pay attention to the require and then a replace.
Local modules does not get a checksum. make sense, integrity is not as important for local


```
go mod tidy

```

This gives error that the module cannot be found in the examples.com http address.
go: finding module for package example.com/greetings-errors
go: example.com/hello imports
        example.com/greetings-errors: cannot find module providing package example.com/greetings-errors: unrecognized import path "example.com/greetings-errors": reading https://example.com/greetings-errors?go-get=1: 404 Not Found

To overcome this replace the dependency

```
go mod edit --replace example.com/greetings-errors=../greetings

```

```
go mod tidy

```