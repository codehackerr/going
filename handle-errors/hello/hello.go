package main

import  (
    "fmt"
    "example.com/greetings"
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
 
    message, err = greetings.Greet("")

    if(err != nil) {
        log.Fatal("Fatal: ", err)
    }
    
    

}