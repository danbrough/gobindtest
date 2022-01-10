package main

import (
  "C"
  "github.com/danbrough/gobindtest/misc"
)

//export GetMessage
func GetMessage() *C.char {
  return C.CString(misc.GetMessage())
}

func main() {
}
