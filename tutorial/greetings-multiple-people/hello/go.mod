module example.com/hello

go 1.26.4

replace example.com/random-greetings => ../greetings

require example.com/multiple-greetings v0.0.0-00010101000000-000000000000

replace example.com/multiple-greetings => ../greetings
