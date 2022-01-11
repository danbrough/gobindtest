package main
/*
#include "gobind.h"


*/
import "C"
import (
  "github.com/danbrough/gobindtest/cids"
  "github.com/danbrough/gobindtest/misc"
  "unsafe"
    ipfsapi "github.com/ipfs/go-ipfs-api"

)



var shell *ipfsapi.Shell

//export GetMessage
func GetMessage() *C.char {
  return C.CString(misc.GetMessage())
}

//export CID
func CID(json *C.char) *C.char {
  s := C.GoString(json)
  return C.CString(cids.DagCid(s))
}

//export CreateShell
func CreateShell(url *C.char) {
  if shell == nil {
    println("creating shell...")
    shell = ipfsapi.NewShell(C.GoString(url))
  } else {
    println("ERROR: shell already exists")
  }
}

//export IPFS_ID
func IPFS_ID() *C.char {
  if shell == nil {
    return nil
  }

  s, err := shell.ID()
  if err != nil {
    return C.CString(err.Error())
  }
  return C.CString(s.ID)
}

//export Free
func Free(s *C.void) {
  if s != nil {
  C.free(unsafe.Pointer(s))
  }
}

//export Request
func Request(command *C.char)  {
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
