package greetings

import ( 
   "fmt"
   "errors"
   "math/rand"
)

// returns greeting for the named person
func Greet(name string) (string, error) {
   
   if name == "" {
      return "", errors.New("Empty Name")
   }
   
   
   msg := fmt.Sprintf(messageFormat(), name)
   
   return msg, nil
}

func messageFormat() string {
   
   formats := []string {
      "Hi %v!",
      "Hello %v!",
      "Namaste %v!",
   }
   
   return formats[rand.Intn(len(formats))]  

}