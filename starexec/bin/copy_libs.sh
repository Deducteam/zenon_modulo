#!/usr/bin/env sh

# package libraries

ROOT="$(dirname $0)"

cp /usr/lib64/libc.so.6 ${ROOT}/
cp /usr/lib64/libdl.so.2 ${ROOT}/
cp /usr/lib64/libm.so.6 ${ROOT}/
cp /usr/lib64/libgmp.so.10 ${ROOT}/
cp /lib64/ld-2.21.so ${ROOT}/ld.so

