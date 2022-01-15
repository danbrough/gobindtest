#!/bin/bash

cd $(dirname $0) && cd ..
source scripts/common.sh

export SRCDIR=`pwd`

build_env(){
  export GOOS=linux
  export GOARCH=$1
  unset CC CXX
  export CGO_ENABLED=1
  #export GOPATH=$WORK
  export CGO_LDFLAGS="-ldl -lpthread -fPIC"
  export CGO_CFLAGS="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux -fPIC"
}


build(){
  go build -tags openssl -v -x -ldflags -w -work -buildmode=c-shared \
  -o=$SRCDIR/jvm/libs/$1/libkipfs.so ./test1
}

build_env $ARCH
build $ARCH




