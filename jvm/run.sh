#!/bin/bash

cd `dirname $0`  
source ../docker/env.sh

if [ ! -f build/classes/java/main/danbroid/kipfs/jni/KIPFS.class ]; then 
	../gradlew classes
fi

LD_LIBRARY_PATH=libs/$ARCH  java -cp build/classes/java/main danbroid.kipfs.jni.KIPFS

