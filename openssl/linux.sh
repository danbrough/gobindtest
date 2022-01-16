#!/bin/bash

cd `dirname $0`

source ../scripts/common.sh

export OPENSSL_LIBS=$SCRIPTDIR/libs/linux/$ARCH

if [ -d $OPENSSL_LIBS ]; then
    echo not building openssl as $OPENSSL_LIBS exists
else
  source common.sh
  ./Configure --prefix="$OPENSSL_LIBS" linux-`uname -m` no-shared || exit 1
  make install_sw || exit 1
fi



