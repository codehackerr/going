package greetings

import (

    "testing"
    "regexp"
)


func TestHelloRandom(t *testing.T) {

    greeting, err := Greet("John")
    
    format := regexp.MustCompile(`\b` + "John")
    
    if !format.MatchString(greeting) || err != nil {
        
        t.Errorf(`Hello("John") = %q, %v, want match for %#q, nil`, greeting, err, format)
  
    }   

}