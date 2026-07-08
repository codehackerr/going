package main

import  (
    "fmt"
    greetings "example.com/greetings-errors"
    "log"
)

func main() {

    // set prefix
    log.SetPrefix("Greetings:")


    // Decalare and init
    message, err := greetings.Greet("John")
    
    fmt.Println(message)

    
    // Assign
    message, err = greetings.Greet("")

    if(err != nil) {
        log.Println("Non fatal: ", err)
    }
    
    // Turn log prefixes off
    
    log.SetFlags(0)

    message, err = greetings.Greet("")

    if(err != nil) {
        log.Println("Non fatal, no prefix", err)
    } 
 
    message, err = greetings.Greet("")

    if(err != nil) {
        log.Fatal("Fatal: ", err)
    }
    
    

}