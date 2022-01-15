#!/bin/bash

cd $(dirname $0) && cd ..
source scripts/common.sh

export SRCDIR=`pwd`
export GOOS=linux
export GOARCH=$ARCH
unset CC CXX
export CGO_ENABLED=1
export CGO_LDFLAGS="-ldl -lpthread -fPIC"
export CGO_CFLAGS="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux -fPIC"
go build -tags openssl  -v -ldflags -w -buildmode=c-shared \
  -o=$SRCDIR/jvm/libs/$ARCH/libkipfs.so ./test1


