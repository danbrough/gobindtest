package main

/*
#cgo LDFLAGS: -L. -ldl
#include <stdlib.h>
*/
import "C"
import (
	"github.com/danbrough/gobindtest/go/cids"
	"github.com/danbrough/gobindtest/go/core"
	"github.com/danbrough/gobindtest/misc"
	ipfsapi "github.com/ipfs/go-ipfs-api"
	log "github.com/sirupsen/logrus"
	"math/rand"
	"unsafe"

	"os"
	"path"
)

var repo *core.Repo = nil
var repoPath string = ""

//export KGetMessage
func KGetMessage() *C.char {
	return C.CString(misc.GetMessage())
}

//export KFree
func KFree(s *C.void) {
	if s != nil {
		C.free(unsafe.Pointer(s))
	}
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

//export KOpenRepo
func KOpenRepo(path *C.char) *C.char {
	if repo != nil {
		return C.CString("A repo is already open at " + repoPath)
	}
	repoPath = C.GoString(path)
	log.Infof("KOpenRepo() %s", repoPath)
	var err error
	repo, err = core.OpenRepo(repoPath)
	if err != nil {
		return C.CString(err.Error())
	}

	return nil
}

//export KCloseRepo
func KCloseRepo() *C.char {
	log.Info("KCloseRepo()")
	if repo != nil {
		err := repo.Close()
		if err != nil {
			return C.CString(err.Error())
		}
		repo = nil
	}
	return nil
}

func init() {
	log.SetReportCaller(true)
	log.SetLevel(log.TraceLevel)
	log.Info("init()")
	log.Warn("warning")
	log.Debug("debug")
	log.Trace("trace")
}

const letterBytes = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

func RandStringBytesRmndr(n int) string {
	b := make([]byte, n)
	for i := range b {
		b[i] = letterBytes[rand.Int63()%int64(len(letterBytes))]
	}
	return string(b)
}

//export KBigString
func KBigString(size int) *C.char {
	return C.CString(RandStringBytesRmndr(size))
}

func main() {

	const json = `
  {
    "name": "Wally",
    "age" : 123
  }
  `

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
	repoPath = path.Join(home, ".kipfs_tests/repo")
	initialized := core.RepoIsInitialized(repoPath)

	log.Infof("%s is initialized %t\n", repoPath, initialized)

	if initialized {
		log.Debugf("%s is initialized", repoPath)
	} else {
		log.Info("Initializing repo at " + repoPath)
		core.InitRepoDefaultConfig(repoPath)
	}

	dir, err := os.UserHomeDir()
	if err != nil {
		return
	}
	repoPath = path.Join(dir, ".kipfs_tests/repo")
	if !core.RepoIsInitialized(repoPath) {
		log.Info("initializing repo at " + repoPath)
		core.InitRepoDefaultConfig(repoPath)
	}
	repo, err := core.OpenRepo(repoPath)
	if err != nil {
		log.Error("Error" + err.Error())
		log.Panic(err)
	}

	log.Info("opened repo " + repo.GetRootPath() + " at " + repoPath)
	err = repo.Close()
	if err != nil {
		log.Error(err)
		return
	}

	log.Info("closed repo")

}
