#!/bin/sh
inst_dir="`dirname $0`/bin"

# enable quiet mode
sudo $inst_dir/p37ec-aero 0x0C.4 0
sudo $inst_dir/p37ec-aero 0x08.6 1
