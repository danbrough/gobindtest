#!/bin/bash

cd $(dirname $0) && cd ..
source scripts/common.sh

#GOBIND="go run golang.org/x/mobile/cmd/gobind@latest"


BUILDDIR=$ROOTDIR/lib/build/go_native
WORK=$BUILDDIR/work
export CGO_ENABLED=1
export CGO_LDFLAGS="-fPIC"
export CGO_CFLAGS="-fPIC  -D__GOBIND_LINUX__ -I$JAVA_HOME/include -I$JAVA_HOME/include/linux"

rm -rf $BUILDDIR
mkdir -p $BUILDDIR
cd $BUILDDIR

$GOBIND -lang=go,java -outdir=work $PACKAGES || exit 1
cd $WORK/src

go build -v -x -work -buildmode=c-archive -o=$BUILDDIR/amd64/libgobind.a ./gobind
