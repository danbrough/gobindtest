#!/bin/bash

cd `dirname $0` 

LIBNAME=libgobindtest.so

export CGO_LDFLAGS="-ldl -lpthread"
go build -buildmode=c-archive -o $LIBNAME .
#strip $LIBNAME



