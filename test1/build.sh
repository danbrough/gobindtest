#!/bin/bash

cd `dirname $0` 

LIBNAME=libgobindtest.a

export CGO_LDFLAGS="-ldl"
go build -buildmode=c-archive -o $LIBNAME .
#strip $LIBNAME



