#!/bin/sh

arch=$(uname -m)
if [ "$1" = "run" ]; then
    shift 2
    "$@"
    exit $?
fi
if [ "$*" = "toolchain list" ]; then
    echo "stable-$arch-unknown-linux-gnu (active, default)"
elif [ "$*" = "target list --toolchain stable-$arch-unknown-linux-gnu --installed" ]; then
    echo "$arch-unknown-linux-gnu"
else
    echo "$* Not supported"
    exit 1
fi
