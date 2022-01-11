#!/bin/bash

cd $(dirname $0) && cd ..
source scripts/common.sh

#GOBIND="go run golang.org/x/mobile/cmd/gobind"


#GOBIND=gobind
#GOMOBILE="go run golang.org/x/mobile/cmd/gomobile"
#GOMOBILE="go run github.com/danbrough/mobile/cmd/gomobile"
#GOMOBILE=gomobile
#$GOBIND  -javapkg=go.gobindtest -lang=java,go -outdir=build/go $PACKAGES

BUILDDIR=$ROOTDIR/lib/build/go
WORK=$BUILDDIR/work
JSRC=$ROOTDIR/lib/src/jvmMain/java

rm -rf $BUILDDIR
mkdir -p $BUILDDIR
#$GOMOBILE bind -work -x -v  -target=linux  $PACKAGES | tee ./build/go/build.log
cd $BUILDDIR

$GOBIND -javapkg=go.bindtest -lang=go,java -outdir=work -tags=jvm $PACKAGES || exit 1


cd $WORK/src

#export CC_FOR_TARGET=aarch64-linux-gnu-gcc

unsetAll(){
  unset GOARCH GOARM CC CFLAGS
  export CGO_ENABLED=1
  export JAVA_HOME=$ROOTDIR/javahome/linux
  export CGO_CFLAGS="-I$JAVA_HOME/include -I$JAVA_HOME/include/linux"
  export CGO_LDFLAGS="-fPIC"
}

build(){
  go build -v -x -work -buildmode=c-archive -o=$ROOTDIR/lib/build/libs/$1/$2 ./gobind
}

build_arm64() {
  unsetAll
  export GOARCH=arm64
  export CC=aarch64-linux-gnu-gcc
  build jni/$GOARCH libgojni.so
}

build_amd64() {
  unsetAll
  export GOARCH=amd64
  build jni/$GOARCH libgojni.a
}

build_windows() {
  unsetAll
  export GOOS=windows
  export GOARCH=amd64
  export CFLAGS="-Wno-macro-redefined"
  export CC=/usr/bin/x86_64-w64-mingw32-gcc
  export CXX=/usr/bin/x86_64-w64-mingw32-c++
  OPENSSL_LIBS=/home/dan/workspace/android/ipfs_mobile/build/libs/openssl/win32/
  export JAVA_HOME=$ROOTDIR/javahome/win32
  export CGO_CFLAGS="-fPIC -static -I$OPENSSL_LIBS/include -I$JAVA_HOME/include -I$JAVA_HOME/include/win32"
  export CGO_LDFLAGS="-static -fPIC -L/usr/x86_64-w64-mingw32/lib/ -L$OPENSSL_LIBS/lib -lcrypto -lcrypt32  -lpthread -lws2_32 "
  build jni/win32 libgojni.dll 
}


copy_java(){
  rm -rf $JSRC/go
  cp -a $WORK/java/go $JSRC/
}

build_amd64
build_arm64
build_windows

copy_java
