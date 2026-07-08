package greetings

import ( 
   "fmt"
   "errors"
   "math/rand"
)


// all as a single message
func GreetAll(names []string) (map[string]string, error) {

   if len(names) == 0 {
      return nil, errors.New("No one to greet!")
   }
   
   messages := make(map[string]string)
   
   for _, name := range names {
   
      msg, err := Greet(name)
      
      if err != nil {
         return nil, err
      }
      
      messages[name] = msg
   }
   
   return messages, nil

}


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