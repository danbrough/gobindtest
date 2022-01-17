#!/bin/bash

useradd  -M -s /bin/bash kipfs


ENVFILE=/home/kipfs/src/docker/env.sh

[ -f $ENVFILE ] && source $ENVFILE

ARCH=`uname -m`
GOVERSION=1.17.6
#GOVERSION=1.16.12

if [ $ARCH = "x86_64" ]; then
  DOWNLOAD=go$GOVERSION.linux-amd64.tar.gz
  ARCH=amd64
elif [ $ARCH = "aarch64" ]; then
  ARCH=arm64
  DOWNLOAD=go$GOVERSION.linux-arm64.tar.gz
elif [ $ARCH = "armv7l" ]; then
  ARCH=arm
  DOWNLOAD=go$GOVERSION.linux-armv6l.tar.gz
fi

sed -i -e /ARCH=/d  -e /JAVA_HOME=/d /etc/environment
echo ARCH=$ARCH >> /etc/environment

if [ ! -d /opt/go ]; then
  cd /tmp
  echo downloading go from https://golang.org/dl/$DOWNLOAD ..
  curl -OL https://golang.org/dl/$DOWNLOAD || exit 1
  tar xvpf $DOWNLOAD -C /opt > /dev/null || exit 1
  rm $DOWNLOAD
fi


export ANDROID_NDK_ROOT=/opt/ndk

if [ "$ARCH" == "amd64" ] && [ ! -d $ANDROID_NDK_ROOT ]; then
  cd /opt
  DOWNLOAD=https://dl.google.com/android/repository/android-ndk-r23b-linux.zip
  echo "downloading android ndk from $DOWNLOAD"
  curl  -L $DOWNLOAD -o ndk.zip
  unzip ndk.zip
  mv /opt/android-ndk* $ANDROID_NDK_ROOT
  chown kipfs:kipfs -R $ANDROID_NDK_ROOT

  rm ndk.zip
  #echo installing android-sdk-platform-tools android-sdk-platform-23
  #apt install -y android-sdk-platform-tools android-sdk-platform-23
fi


rm -rf /tmp/*


