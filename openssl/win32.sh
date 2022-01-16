#!/bin/bash

cd `dirname $0`

source common.sh

export OPENSSL_LIBS=$SCRIPTDIR/libs/win32
export CC=x86_64-w64-mingw32-gcc
export CXX=x86_64-w64-mingw32-cpp
export WINDRES=x86_64-w64-mingw32-windres



if [ -d $OPENSSL_LIBS ]; then
    echo not building openssl as $OPENSSL_LIBS exists
else
	cd $SRC
  ./Configure --prefix="$OPENSSL_LIBS" mingw64 no-shared || exit 1
  make install_sw || exit 1
fi



