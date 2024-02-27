#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"

# enable normal mode
sudo $inst_dir/p37ec-aero 0x13.3 1 # fan control enabled
sudo $inst_dir/p37ec-aero 0x08.6 0 # quiet mode disabled
sudo $inst_dir/p37ec-aero 0x0D.0 0 # custom mode disabled
sudo $inst_dir/p37ec-aero 0x06.4 0 # fixed speed disabled
sudo $inst_dir/p37ec-aero 0x0C.4 0 # gaming mode disabled
sudo $inst_dir/p37ec-aero 0x0D.7 0 # deep control disabled


sudo $inst_dir/p37ec-aero 