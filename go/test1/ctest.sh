#!/bin/bash

cd `dirname $0`

./build.sh || exit 1
gcc c/test.c -o ctest -lgobindtest -L`pwd` -I`pwd`  -lpthread &&  ./ctest 
