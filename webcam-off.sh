#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"

# disable webcam
sudo $inst_dir/p37ec-aero 0x01.6 0
