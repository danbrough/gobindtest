package main

//int myFun2(int i) {
//return i+10;
//}
//
//typedef int  (*MyFun2)(int);
//
//void accept_fun(MyFun2 f) {
//int c = f(42);
//printf("OK %d\n",c);
//}
//
//MyFun2 supply_fun2() {
//return myFun2;
//}

import (
  "C"
  "github.com/danbrough/gobindtest/cids"
  "github.com/danbrough/gobindtest/misc"
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

//export Request
func Request(command *C.char) C.{
  if shell == nil {
    return nil
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
