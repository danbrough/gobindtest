

if [ -z "$GOROOT" ]; then
  export GOROOT=/opt/go
  export PATH=$GOROOT/bin:$PATH
fi

ARCH=`uname -m`
if [ "$ARCH" == "x86_64" ]; then
  ARCH=amd64
elif [ "$ARCH" == "aarch64" ]; then
    ARCH=arm64
elif [ "$ARCH" == "armv7l" ]; then
	ARCH=arm
	export GOARM=5
fi
export ARCH

[ -z "$GRADLE_USER_HOME" ] && export GRADLE_USER_HOME=/cache/gradle

if [ -z "$GOPATH" ]; then
  GOPATH=/cache/gopath/$ARCH
  export PATH=$GOPATH/bin:$PATH
fi

export GOPATH


if [ -z "$ANDROID_NDK_ROOT" ]; then
  export ANDROID_NDK_ROOT=/opt/ndk
fi

export ANDROID_NDK_HOME=$ANDROID_NDK_ROOT

if [ -z "$ANDROID_HOME" ]; then
  export ANDROID_HOME=/usr/lib/android-sdk
fi


if [ -z $JAVA_HOME ]; then
  export JAVA_HOME=/usr/lib/jvm/default-java/
fi


function install_gobind() {
  which gobind > /dev/null  && return
  echo '# installing gobind ...'
  cd $SRCDIR
  go mod download
  go get -d  github.com/danbrough/mobile
  go install  github.com/danbrough/mobile/cmd/gobind@latest
}
