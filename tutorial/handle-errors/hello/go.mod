module example.com/hello

go 1.26.4

replace example.com/greetings-errors => ../greetings

require example.com/greetings-errors v0.0.0-00010101000000-000000000000
