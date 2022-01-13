package main

/*
#include <stdlib.h>
*/
import "C"
import (
	"github.com/danbrough/gobindtest/test2/stuff"
)

//export GetMessage
func GetMessage() *C.char {
	return C.CString(stuff.GetMessage())
}

func main() {
	println(stuff.GetMessage())

}
