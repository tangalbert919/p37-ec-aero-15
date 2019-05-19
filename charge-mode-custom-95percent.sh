#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"

# custom charging, allow 95% maximum charge
sudo $inst_dir/p37ec-aero 0x0F.2 1
sudo $inst_dir/p37ec-aero 0xC6.0 1
sudo $inst_dir/p37ec-aero 0xA9 0x5F


