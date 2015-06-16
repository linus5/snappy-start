#!/bin/bash

set -eu

cflags="-O2 -g -Wall -Werror"

gcc $cflags -static -nostdlib example_loader.c -o example_loader
gcc $cflags -static -nostdlib example_prog.c -o example_prog
g++ $cflags -std=c++11 ptracer.cc -o ptracer
g++ $cflags -std=c++11 restore.cc -o restore

./ptracer ./example_loader
./restore

./example_prog
