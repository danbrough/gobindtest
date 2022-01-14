#!/bin/sh

cd `dirname $0` 
../gradlew classes 
rm -rf libs/* 
cd libs
cmake ../src/main/c
make
cd ../../
LD_LIBRARY_PATH=../libs:jvm/libs  java -cp jvm/build/classes/kotlin/main:/usr/share/kotlin/lib/kotlin-stdlib.jar danbroid.kipfs.jni.KIPFS

