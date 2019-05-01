#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"

# enable wifi
sudo $inst_dir/p37ec-aero 0x02.6 1
