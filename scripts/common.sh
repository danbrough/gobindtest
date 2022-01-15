ROOTDIR=$(pwd)
PACKAGES="github.com/danbrough/gobindtest/misc github.com/danbrough/gobindtest/go/cids"
GOBIND="go run github.com/danbrough/mobile/cmd/gobind"
#GOBIND="go run golang.org/x/mobile/cmd/gobind"
ANDROID_SDK_ROOT=/mnt/files/sdk/android


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
