package main

/*
#include <stdlib.h>
*/
import "C"
import (
	"github.com/danbrough/gobindtest/go/cids"
	"github.com/danbrough/gobindtest/misc"
	ipfsapi "github.com/ipfs/go-ipfs-api"
	ipfsrepo "github.com/ipfs/go-ipfs/repo"
)

var repo ipfsrepo.Repo

//export KGetMessage
func KGetMessage() *C.char {
	return C.CString(misc.GetMessage())
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
