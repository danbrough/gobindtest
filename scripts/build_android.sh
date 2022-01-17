#!/bin/bash

cd $(dirname $0) && cd ..
export SRCDIR=$PWD
source docker/env.sh
rm -rf android/src/main/jniLibs

build_env(){
  export GOOS=android
  export GOARCH=$1
  export CC=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/$2-clang
  export CXX=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/$2-clang++
  export CGO_ENABLED=1
  export CGO_CFLAGS="-I$SRCDIR/openssl/libs/android/$3/include -fPIC"
  export CGO_LDFLAGS="-L$SRCDIR/openssl/libs/android/$3/lib -landroid -llog"
}

build(){
  go mod tidy
  echo
  echo '#####' building $1
  go tool cgo -exportheader test1/libkipfs.h test1/*.go
  go build -tags openssl -v -ldflags -w  -buildmode=c-shared \
  -o=android/src/main/jniLibs/$1/libkipfs.so ./test1
}

build_386(){
  build_env 386 i686-linux-android16 x86
  build x86
}

build_amd64(){
  build_env amd64 x86_64-linux-android31 x86_64
  build x86_64
}

build_arm64(){
  build_env arm64 aarch64-linux-android31 arm64-v8a
  export GOARM=7
  build arm64-v8a
}

build_arm32(){
  build_env arm armv7a-linux-androideabi31 armeabi-v7a
  export GOARM=7
  build armeabi-v7a
}

./openssl/android.sh

if [ -z "$1" ]; then
  build_amd64
  build_386
  build_arm32
  build_arm64
else
  build_$1
fi
