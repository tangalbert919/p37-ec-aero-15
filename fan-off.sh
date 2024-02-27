#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"

# keep fans off always (warning, this can make the laptop ge really hot)
sudo $inst_dir/p37ec-aero 0x13.3 1 # fan control enabled
sudo $inst_dir/p37ec-aero 0x08.6 0 # quiet mode disabled
sudo $inst_dir/p37ec-aero 0x0D.0 1 # custom mode enabled
sudo $inst_dir/p37ec-aero 0x06.4 1 # fixed speed enabled
sudo $inst_dir/p37ec-aero 0x0C.4 0 # gaming mode disabled
sudo $inst_dir/p37ec-aero 0x0D.7 0 # deep control disabled
sudo $inst_dir/p37ec-aero 0xB0   0 # fan 1 speed = 0
sudo $inst_dir/p37ec-aero 0xB1   0 # fan 2 speed = 0

sudo $inst_dir/p37ec-aero