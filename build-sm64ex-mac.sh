#!/bin/zsh

# Get working directories
scriptdir="${0:a:h}"
repodir=$1

if [[ -z "${repodir}" ]]; then
    echo "Error: sm64ex repo directory must be provided as an argument."
    exit 1
fi

repodir=$(realpath "$repodir")

# Build game executable
cd "$repodir"
gmake OSX_BUILD=1 -j4

# Cleanup
cd "$scriptdir"
rm -rf out

# Create app bundle
mkdir -p out/sm64ex.app/Contents/MacOS out/sm64ex.app/Contents/Resources
cp "$repodir/build/us_pc/sm64.us.f3dex2e" out/sm64ex.app/Contents/MacOS/sm64ex
cp icon.icns out/sm64ex.app/Contents/Resources
cp Info.plist out/sm64ex.app/Contents
xattr -cr out/sm64ex.app

# Bundle dylibs with app
dylibbundler -b -cd -x out/sm64ex.app/Contents/MacOS/sm64ex -d out/sm64ex.app/Contents/libs
