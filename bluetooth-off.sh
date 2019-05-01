#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"

# enable bluetooth
sudo $inst_dir/p37ec-aero 0x01.7 0
