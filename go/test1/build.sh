#!/bin/bash

cd `dirname $0` 



go build -buildmode=c-archive -o libgobindtest.a github.com/danbrough/gobindtest/go/test1


