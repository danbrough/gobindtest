#!/bin/bash


cd `dirname $0` && cd ..
BUILDDIR=`pwd`/build/go
PACKAGES=github.com/danbrough/gobindtest/core/hello
GOBIND=golang.org/x/mobile/cmd/gobind
GOBIND="go run github.com/danbrough/mobile/cmd/gobind"
GOBIND=gobind
#GOMOBILE="go run golang.org/x/mobile/cmd/gomobile"
GOMOBILE="go run github.com/danbrough/mobile/cmd/gomobile"
GOMOBILE=gomobile
#$GOBIND  -javapkg=go.gobindtest -lang=java,go -outdir=build/go $PACKAGES

rm -rf $BUILDDIR
mkdir -p $BUILDDIR
#$GOMOBILE bind -work -x -v  -target=linux  $PACKAGES | tee ./build/go/build.log

$GOMOBILE  bind  -target=linux/arm64  -x -v -work -o $BUILDDIR   $PACKAGES  2>&1 | tee ./build/go/build.log

