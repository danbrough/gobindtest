#!/bin/bash

cd `dirname $0` 


export CGO_LDFLAGS="-ldl"
go build -buildmode=c-archive -o libgobindtest.a .




