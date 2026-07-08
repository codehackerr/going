package main

import  (
    "fmt"
    greetings "example.com/multiple-greetings"
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