package main

import  (
    "fmt"
    greetings "github.com/codehackerr/going/tutorial/greetings-multiple-people/greetings"
    "log"
)

func main() {
    
    names := []string {"John", "Alice", "Bob"}
    messages, err := greetings.GreetAll(names)

    if(err != nil) {
        log.Fatal("Fatal: ", err)
    }
    
    
    
    fmt.Println(messages)
    
    printFormatted(messages)    
   
}


func printFormatted(greetings map[string]string) {
    
    for name, greeting := range greetings {
        fmt.Printf("%s greeted as %s %s", name, greeting, "\n")
    }
}