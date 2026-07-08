# command 

Implementations of go tutorials in respective sub directories

[Getting Started](https://go.dev/doc/tutorial)

## Note: 
Each sub directory is a self contained example

## Go command examples

initialize go module
```
go mod init example/hello

```

replace local dependencies

```
go mod edit --replace example.com/greetings=./greetings
```

resolve dependencies

```
go mod tidy

```

## Note: No go.sum entries for local modules