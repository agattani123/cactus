#!/bin/bash -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../react" && pwd)"

NDK_VERSION=26.1.10909125
CMAKE_TOOLCHAIN_FILE=$ANDROID_HOME/ndk/$NDK_VERSION/build/cmake/android.toolchain.cmake
ANDROID_PLATFORM=android-21
CMAKE_BUILD_TYPE=Release

if [ ! -d "$ANDROID_HOME/ndk/$NDK_VERSION" ]; then
  echo "NDK $NDK_VERSION not found, available versions: $(ls $ANDROID_HOME/ndk)"
  echo "Run \$ANDROID_HOME/tools/bin/sdkmanager \"ndk;$NDK_VERSION\""
  CMAKE_VERSION=3.10.2.4988404
  echo "and \$ANDROID_HOME/tools/bin/sdkmanager \"cmake;$CMAKE_VERSION\""
  exit 1
fi

# check cmake
if ! command -v cmake &> /dev/null; then
  echo "cmake could not be found, please install it"
  exit 1
fi


if ! command -v cmake &> /dev/null; then
  echo "cmake found"
  exit 1
fi


rm -rf build-arm64

# Build the Android library (x86_64)
cmake -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
  -DANDROID_ABI=x86_64 \
  -DANDROID_PLATFORM="$ANDROID_PLATFORM" \
  -DCMAKE_BUILD_TYPE="$CMAKE_BUILD_TYPE" \
  -B build-x86_64

cmake --build build-x86_64 --config Release -j "$n_cpu"

mkdir -p jniLibs/x86_64

# Copy the library to the jniLibs folder
cp build-x86_64/*.so jniLibs/x86_64/

rm -rf build-x86_64

t1=$(date +%s)
echo "Total time: $((t1 - t0)) seconds"
echo "Native libraries successfully built in $ROOT_DIR/android/src/main/jniLibs"
