#!/bin/bash

cd `dirname $0` 

LIBNAME=libgobindtest.a

export CGO_CFLAGS="-fPIC"
export CGO_LDFLAGS="-ldl -lpthread -fPIC"
go build -buildmode=c-archive -o $LIBNAME .
#strip $LIBNAME



