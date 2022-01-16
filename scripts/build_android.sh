#!/bin/bash

cd $(dirname $0) && cd ..
source scripts/common.sh

rm -rf android/src/main/jniLibs

build_env(){
  export GOOS=android
  export GOARCH=$1
  export CC=$ANDROID_HOME/ndk/23.1.7779620/toolchains/llvm/prebuilt/linux-x86_64/bin/$2-clang
  export CXX=$ANDROID_HOME/ndk/23.1.7779620/toolchains/llvm/prebuilt/linux-x86_64/bin/$2-clang++
  export CGO_ENABLED=1
  export CGO_CFLAGS="-I/home/dan/workspace/android/ipfs_mobile/openssl/libs/$3/include -fPIC"
  export CGO_LDFLAGS="-L/home/dan/workspace/android/ipfs_mobile/openssl/libs/$3/lib -landroid -llog"
}

build(){
  go mod tidy
  echo building $1
  go build -tags openssl -v -ldflags -w  -buildmode=c-shared \
  -o=android/src/main/jniLibs/$1/libgojni.so ./test1
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


build_amd64
build_386
build_arm32
build_arm64
