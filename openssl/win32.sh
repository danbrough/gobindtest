#!/bin/bash

cd `dirname $0`

source common.sh

export OPENSSL_LIBS=$SCRIPTDIR/libs/win32
cd $SRC

if [ -d $OPENSSL_LIBS ]; then
    echo not building openssl as $OPENSSL_LIBS exists
else
  ./Configure --prefix="$OPENSSL_LIBS" mingw64 no-shared || exit 1
  make install_sw || exit 1
fi



