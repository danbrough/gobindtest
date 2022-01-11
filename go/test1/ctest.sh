#!/bin/bash

cd `dirname $0`

gcc c/test.c -o ctest -lgobindtest -L`pwd` -I`pwd`  -lpthread &&  ./ctest 
