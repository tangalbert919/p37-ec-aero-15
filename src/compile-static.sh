#!/bin/sh
# This script compiles a static binary which can run without any external libraries.
#
# For this you need to install:
#  g++
#  libstdc++-static
#  libc-static
mkdir ../bin 2>/dev/null

g++ -static -static-libgcc -static-libstdc++ -o ../bin/p37ec-aero p37ec-aero.c

chmod +x ../bin/p37ec-aero