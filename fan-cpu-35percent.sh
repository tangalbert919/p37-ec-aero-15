#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"
own_dir="$(dirname $(readlink -f $0))"

# keep fan on the cpu side running at 35% but turn off gpu fan
# 80 -> 35%
$own_dir/fan-fixed.sh 80 0
