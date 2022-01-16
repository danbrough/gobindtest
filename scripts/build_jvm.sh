#!/bin/bash

cd $(dirname $0) && cd ..
source scripts/common.sh

export SRCDIR=`pwd`
export GOOS=linux
export GOARCH=$ARCH
unset CC CXX
export JAVA_HOME=$SRCDIR/jdk/linux
export CGO_ENABLED=1
export CGO_LDFLAGS="-ldl -lpthread -fPIC"
export CGO_CFLAGS="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux -fPIC"

build_linux(){
  go build -tags openssl  -v -ldflags -w -buildmode=c-shared \
    -o=$SRCDIR/jvm/libs/$ARCH/libkipfs.so ./test1
}


build_win32(){
  ./openssl/win32.sh
  export GOOS=windows
  export GOARCH=amd64
  export OPENSSL_LIBS=$SRCDIR/openssl/libs/win32
  export JAVA_HOME=$SRCDIR/jdk/win32
  export CFLAGS="-Wno-macro-redefined"
  export CC=x86_64-w64-mingw32-gcc
  export CXX=x86_64-w64-mingw32-c++
  export CGO_CFLAGS="-fPIC -static -I$OPENSSL_LIBS/include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/win32 "
  export CGO_LDFLAGS="-static -fPIC -L/usr/x86_64-w64-mingw32/lib/ -L$OPENSSL_LIBS/lib -lcrypto -lcrypt32  -lpthread -lws2_32 "

  go build -tags openssl  -x -v -ldflags -w -buildmode=c-shared \
    -o=$SRCDIR/jvm/libs/win32/libkipfs.dll ./test1
}

if [  "$ARCH" == "amd64" ]; then
  build_win32
fi

build_linux
