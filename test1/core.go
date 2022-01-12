package main
/*
#include <stdlib.h>
 */
import "C"
import "unsafe"

//export KFree
func KFree(s *C.void) {
	if s != nil {
		C.free(unsafe.Pointer(s))
	}
}
