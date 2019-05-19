#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"

# enable default charging mode
sudo $inst_dir/p37ec-aero 0x0F.2 0
sudo $inst_dir/p37ec-aero 0xC6.0 0
sudo $inst_dir/p37ec-aero 0xA9   0x61

