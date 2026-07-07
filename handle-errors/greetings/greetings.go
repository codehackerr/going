package greetings

import ( 
   "fmt"
   "errors"
)

// returns greeting for the named person
func Greet(name string) (string, error) {
   
   if name == "" {
      return "", errors.New("Empty Name")
   }
   
   msg := fmt.Sprintf("Hi %v, great to see you", name)
   
   return msg, nil
}