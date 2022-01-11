#!/bin/bash

cd `dirname $0` 

PACKAGES="github.com/danbrough/gobindtest/test1 github.com/danbrough/gobindtest/misc"


go build -buildmode=c-archive -o libgobindtest.a github.com/danbrough/gobindtest/test1


