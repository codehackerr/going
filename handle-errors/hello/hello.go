package main

import  (
    "fmt"
    "example.com/greetings"
    "log"
)

func main() {

    message, err := greetings.Greet("John")
    
    if(err != nil) {
        log.Fatal(err)
    }

    fmt.Println(message)
}