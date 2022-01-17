#!/bin/bash


PLATFORM="$1"

if [ -z "$PLATFORM" ]; then
	PLATFORM=amd64
	echo using default platform $PLATFORM
fi 

NAME=debian
#Place to store cache files
CACHEDIR=/mnt/files2/cache
#PLATFORM=$AMD64
#NAME=debby_amd64

echo running `realpath setup.sh` in $image

[ ! -d $CACHEDIR/$PLATFORM ] && mkdir $CACHEDIR/$PLATFORM



docker run -it --name "${NAME}_${PLATFORM}"  -h ${NAME}_${PLATFORM} \
	-v `realpath ../..`:/home/kipfs/src \
	-v $CACHEDIR:/cache -v /tmp:/tmp -v $CACHEDIR/$PLATFORM:/home/kipfs/.cache \
	--platform=linux/$PLATFORM \
	danbrough/debian:latest \
	bash

#docker run -it --name "${NAME}_${PLATFORM}"  -h ${NAME}_${PLATFORM} \
#	-v `realpath ../..`:/home/kipfs/src \
#	-v $CACHEDIR:/cache -v /tmp:/tmp -v $CACHEDIR/$PLATFORM:/home/kipfs/.cache \
#	--platform=linux/$PLATFORM \
#	danbrough/debian:latest  \
#	bash 
