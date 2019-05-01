#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"

# enable touchpad
sudo $inst_dir/p37ec-aero 0x03.5 1

