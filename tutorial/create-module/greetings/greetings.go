package greetings

import "fmt"

// returns greeting for the named person
func Greet(name string) string {
   msg := fmt.Sprintf("Hi %v, great to see you", name)
   return msg
}