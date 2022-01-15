#!/bin/bash

cd `dirname $0` 

LIBNAME=libgobindtest.so

export CGO_CFLAGS="-fPIC"
export CGO_LDFLAGS="-ldl  -fPIC"
go build -buildmode=c-shared -o $LIBNAME .
#strip $LIBNAME



