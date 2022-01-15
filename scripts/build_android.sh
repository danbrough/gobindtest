#!/bin/bash

cd $(dirname $0) && cd ..
source scripts/common.sh


export GOOS=android
export GOARCH=386
export CC=$ANDROID_HOME/ndk/23.1.7779620/toolchains/llvm/prebuilt/linux-x86_64/bin/i686-linux-android16-clang
export CXX=$ANDROID_HOME/ndk/23.1.7779620/toolchains/llvm/prebuilt/linux-x86_64/bin/i686-linux-android16-clang++
export CGO_ENABLED=1
export CGO_CFLAGS="-I/home/dan/workspace/android/ipfs_mobile/openssl/libs/x86/include"
export CGO_LDFLAGS="-L/home/dan/workspace/android/ipfs_mobile/openssl/libs/x86/lib"
export WORK=/tmp/work
export GOPATH=$WORK

[ ! -d $WORK ] && mkdir $WORK
[ ! -s $WORK/src ] && ln -s `pwd` $WORK/src


go build -tags openssl -v -x -ldflags -w -work -buildmode=c-shared \
  -o=$WORK/src/android/src/main/jniLibs/x86/libgojni.so ./test1