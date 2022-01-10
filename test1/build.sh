#!/bin/bash

cd `dirname $0` 

go build -buildmode=c-archive -o libgojni.a github.com/danbrough/gobindtest/test1 
