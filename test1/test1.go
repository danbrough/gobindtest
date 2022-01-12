package main

/*
#include <stdlib.h>
*/
import "C"
import (
	"github.com/danbrough/gobindtest/go/cids"
	"github.com/danbrough/gobindtest/go/core"
	"github.com/danbrough/gobindtest/misc"
	ipfsapi "github.com/ipfs/go-ipfs-api"
	ipfsrepo "github.com/ipfs/go-ipfs/repo"
	log "github.com/sirupsen/logrus"

	"os"
	"path"
)

var repo ipfsrepo.Repo

//export KGetMessage
func KGetMessage() *C.char {
	return C.CString(misc.GetMessage())
}

//export KRepoIsInitialized
func KRepoIsInitialized(pathC *C.char) bool {
	return core.RepoIsInitialized(C.GoString(pathC))
}

//export KInitRepo
func KInitRepo(path *C.char) {
	pathGo := C.GoString(path)
	core.InitRepoDefaultConfig(pathGo)
}
func init() {
	log.SetReportCaller(true)
	log.Info("init()")
}

func main() {

	const json = `
  {
    "name": "Wally",
    "age" : 123
  }
  `

	log.Info("Some info here")

	log.Error("repo:", repo)
	var dag1 = cids.DagCid(json)
	log.Trace("DAG1: " + dag1)
	log.Debug("DAG2: " + cids.DagCid("\"Hello World\""))
	shell := ipfsapi.NewShell("/ip4/192.168.1.4/tcp/5001")
	id, err := shell.ID()
	if err != nil {
		return
	}

	log.Warn("ID: " + id.ID + " agent: " + id.AgentVersion)

	home, err := os.UserHomeDir()
	log.Info("HOME:", home)
	repoDir := path.Join(home, ".kipfs_tests/repo")
	initialized := core.RepoIsInitialized(repoDir)

	log.Debugf("%s is initialized %t\n", repoDir, initialized)

	if initialized {
		log.Debugf("%s is initialized", repoDir)
	} else {
		log.Info("Initializing repo at " + repoDir)
		core.InitRepoDefaultConfig(repoDir)
	}

}
