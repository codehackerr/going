package main

import  (
    "fmt"
    greetings "example.com/random-greetings"
    "log"
)

func main() {

    // set prefix
    log.SetPrefix("Greetings:")

    
    //each call should get a random greeting
    greet()
    greet()
    greet()
    greet()
    greet()
 }
 
 func greet() {
    // suppress unused _
    message, _ := greetings.Greet("John")
    
    fmt.Println(message)
 }