package main

import (
  "github.com/danbrough/gobindtest/core/hello"
)

func main() {
  s := hello.GetMessage()
  println("The message is", s)
}
