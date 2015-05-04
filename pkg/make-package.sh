#!/bin/bash
set -e

NAME=${NAME:=name}
VERSION=${VERSION:=0.0.1}
PREFIX=${PREFIX:=/usr/bin}
ARCH=$(uname -m)
DATE=$(date +"%s")

BUILD=$(pwd)/"$NAME"-"$VERSION"
PPATH="$BUILD""$PREFIX"/"$NAME"
mkdir -p "$PPATH"

go build -o "$NAME" .

cp "$NAME" "$PPATH"/

fpm \
    -s dir \
    -t rpm \
    --epoch "$DATE" \
    -v "$VERSION" \
    -n "$NAME" \
    -a "$ARCH" \
    -C "$BUILD" \
    .

fpm \
    -s dir \
    -t deb \
    --epoch "$DATE" \
    -v "$VERSION" \
    -n "$NAME" \
    -a "$ARCH" \
    -C "$BUILD" \
    .

mv ./*.rpm /dist/
mv ./*.deb /dist/
