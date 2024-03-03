#!/bin/bash


if [ $# -ne 2 ]; then
  echo usage: 
  echo $0 '<speed-for-fan-1>'  '<speed-for-fan-2>'
  echo 'WARNING: speed should either be set to 0 or >30%; Values other than 0 that are below below 30% (i.e., below 68 decimal) are unsafe!!'
  echo ''
  echo 'speed values to be passed for the desired speeds:'
  echo '0   -> fan stopped'
  echo '68  -> 30%'
  echo '80  -> 35%'
  echo '91  -> 40%'
  echo '103 -> 45%'
  echo '114 -> 50%'
  echo '125 -> 55%'
  echo '137 -> 60%'
  echo '148 -> 65%'
  echo '160 -> 70%'
  echo '171 -> 75%'
  echo '183 -> 80%'
  echo '194 -> 85%'
  echo '206 -> 90%'
  echo '217 -> 95%'
  echo '229 -> 100%'
  exit 1
fi

inst_dir="$(dirname $(readlink -f $0))/bin"


# run fans at a fixed speed
sudo $inst_dir/p37ec-aero 0x13.3 1 # fan control enabled
sudo $inst_dir/p37ec-aero 0x08.6 0 # quiet mode disabled
sudo $inst_dir/p37ec-aero 0x0D.0 1 # custom mode enabled
sudo $inst_dir/p37ec-aero 0x06.4 1 # fixed speed enabled
sudo $inst_dir/p37ec-aero 0x0C.4 0 # gaming mode disabled
sudo $inst_dir/p37ec-aero 0x0D.7 0 # deep control disabled
sudo $inst_dir/p37ec-aero 0xB0   $1 # fan 1 speed
sudo $inst_dir/p37ec-aero 0xB1   $2 # fan 2 speed

sudo $inst_dir/p37ec-aero