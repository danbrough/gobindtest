package main

/*
#include <stdlib.h>
*/
import "C"
import (
	"github.com/danbrough/gobindtest/cids"
	"github.com/danbrough/gobindtest/misc"
	ipfsapi "github.com/ipfs/go-ipfs-api"
	ipfsrepo "github.com/ipfs/go-ipfs/repo"
	"unsafe"
)

var shell *ipfsapi.Shell
var repo ipfsrepo.Repo

//export kGetMessage
func kGetMessage() *C.char {
	return C.CString(misc.GetMessage())
}

//export kCID
func kCID(json *C.char) *C.char {
	return C.CString(cids.DagCid(C.GoString(json)))
}

//export kCreateShell
func kCreateShell(url *C.char) {
	if shell == nil {
		println("creating shell...")
		shell = ipfsapi.NewShell(C.GoString(url))
	} else {
		println("ERROR: shell already exists")
	}
}

//export kIpfsID
func kIpfsID() *C.char {
	if shell == nil {
		return nil
	}

	s, err := shell.ID()
	if err != nil {
		return C.CString(err.Error())
	}
	return C.CString(s.ID)
}

//export kFree
func kFree(s *C.void) {
	if s != nil {
		C.free(unsafe.Pointer(s))
	}
}

//export kRequest
func kRequest(command *C.char) {
	if shell == nil {
		return
	}
}

func main() {

	const json = `
  {
    "name": "Wally",
    "age" : 123
  }
  `
	var dag1 = cids.DagCid(json)
	println("DAG1: " + dag1)
	println("DAG2: " + cids.DagCid("\"Hello World\""))
	shell = ipfsapi.NewShell("/ip4/192.168.1.4/tcp/5001")
	id, err := shell.ID()
	if err != nil {
		return
	}

	println("ID: " + id.ID + " agent: " + id.AgentVersion)
}
