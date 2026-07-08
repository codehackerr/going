# Go getting started

Implementations of go tutorials in respective sub directories

[Getting Started](https://go.dev/doc/tutorial)

If you are here to learn go, try doing everything from a minimal editor and command line.
No IDEs yet. This builds familiarity and understanding of go echo systems otherise hidden behind IDEs

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


Run 

```
go mod run .

```
