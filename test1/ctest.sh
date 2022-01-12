#!/bin/bash

cd `dirname $0`


[ ! -f libgobindtest.a ] && ./build.sh 
gcc c/test.c -o ctest -ldl  -lgobindtest -L`pwd` -I`pwd`  -lpthread &&  ./ctest 
