#!/bin/bash

cd `dirname $0` 


GOFILES="test1.go core.go shell.go"


go build -buildmode=c-archive -o libgobindtest.a $GOFILES




