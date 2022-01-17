#!/bin/bash

cd `dirname $0`

source ../docker/env.sh
source common.sh

export ARCH=arm64
export OPENSSL_LIBS=$SCRIPTDIR/libs/linux/$ARCH

if [ -d $OPENSSL_LIBS ]; then
    echo not building openssl as $OPENSSL_LIBS exists
else
  export CC=aarch64-linux-gnu-gcc
  export CXX=aarch64-linux-gnu-g++
  echo prefix is $OPENSSL_LIBS
  ./Configure --prefix="$OPENSSL_LIBS" linux-aarch64  no-shared || exit 1
  make install_sw || exit 1
fi



