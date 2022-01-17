#!/bin/bash

cd $(dirname $0) && cd ..
source docker/env.sh

export GOOS=linux
export GOARCH=$ARCH
unset CC CXX
export JAVA_HOME=$SRCDIR/jdk/linux
export CGO_ENABLED=1
export CGO_LDFLAGS="-ldl -lpthread -fPIC"
export CGO_CFLAGS="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux -fPIC"

build_linux(){
  ./openssl/linux.sh
  export PKG_CONFIG_PATH=$SRCDIR/openssl/libs/linux/$ARCH/lib/pkgconfig/
  export CGO_CFLAGS="$CGO_CFLAGS -I$SRCDIR/openssl/libs/linux/amd64/include -static"
  export CGO_LDFLAGS="-L$SRCDIR/openssl/libs/linux/amd64/lib -lcrypto -lssl -ldl -lpthread -fPIC"
  go tool cgo -exportheader test1/libkipfs.h test1/*.go
  go build -tags openssl  -v -ldflags -w -buildmode=c-shared \
    -o=$SRCDIR/jvm/libs/$ARCH/libkipfs.so ./test1
}

build_linux_arm64(){
    ./openssl/linux_arm64.sh
  export GOOS=linux
  export GOARCH=arm64
  export GOARM=7
  export ARCH=arm64
  export CC=aarch64-linux-gnu-gcc
  export CXX=aarch64-linux-gnu-g++
  export PKG_CONFIG_PATH=$SRCDIR/openssl/libs/linux/$ARCH/lib/pkgconfig/

  export CGO_CFLAGS="$CGO_CFLAGS -I$SRCDIR/openssl/libs/linux/arm64/include -static"
  export CGO_LDFLAGS="-L$SRCDIR/openssl/libs/linux/arm64/lib -lcrypto -lssl -ldl -lpthread -fPIC"

  go tool cgo -exportheader test1/libkipfs.h test1/*.go
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
  export PKG_CONFIG_PATH=$SRCDIR/openssl/libs/win32/lib/pkgconfig/
  export CC=x86_64-w64-mingw32-gcc
  export CXX=x86_64-w64-mingw32-c++
  export CGO_CFLAGS="-fPIC -static -I$OPENSSL_LIBS/include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/win32 "
  export CGO_LDFLAGS="-static -fPIC -L/usr/x86_64-w64-mingw32/lib/ -L$OPENSSL_LIBS/lib -lcrypto -lcrypt32  -lpthread -lws2_32 "
  go tool cgo -exportheader test1/libkipfs.h test1/*.go

  go build -tags openssl  -x -v -ldflags -w -buildmode=c-shared \
    -o=$SRCDIR/jvm/libs/win32/libkipfs.dll ./test1
}

build_linux
build_linux_arm64
build_win32



