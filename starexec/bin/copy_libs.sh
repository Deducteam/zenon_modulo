#!/usr/bin/env sh

# package libraries

ROOT="$(dirname $0)"

cp /lib/x86_64-linux-gnu/libc.so.6 ${ROOT}/
cp /lib/x86_64-linux-gnu/libdl.so.2 ${ROOT}/
cp /lib/x86_64-linux-gnu/libm.so.6 ${ROOT}/
cp /usr/lib/x86_64-linux-gnu/libgmp.so.10 ${ROOT}/
cp /lib/x86_64-linux-gnu/ld-2.19.so ${ROOT}/ld.so

