#!/bin/bash

VERSION=2.0.0
NAME=go-dist-example
PREFIX=/usr/bin

docker build -t package-"$NAME" -f pkg/package.docker .

docker run \
    -e NAME="$NAME" \
    -e VERSION="$VERSION" \
    -e PREFIX="$PREFIX" \
    -v "$PWD"/dist:/dist \
    package-"$NAME"
