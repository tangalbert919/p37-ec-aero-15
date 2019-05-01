#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"

# disable wifi
sudo $inst_dir/p37ec-aero 0x02.6 0
