package main

import "C"
import (
	"github.com/danbrough/gobindtest/go/cids"
	ipfsapi "github.com/ipfs/go-ipfs-api"
)

var shell *ipfsapi.Shell

//export KCID
func KCID(json *C.char) *C.char {
	return C.CString(cids.DagCid(C.GoString(json)))
}

//export KCreateShell
func KCreateShell(url *C.char) {
	if shell == nil {
		println("creating shell...")
		shell = ipfsapi.NewShell(C.GoString(url))
	} else {
		println("ERROR: shell already exists")
	}
}

//export KIpfsID
func KIpfsID() *C.char {
	if shell == nil {
		return nil
	}

	s, err := shell.ID()
	if err != nil {
		return C.CString(err.Error())
	}
	return C.CString(s.ID)
}

//export KRequest
func KRequest(command *C.char) {
	if shell == nil {
		return
	}
}
