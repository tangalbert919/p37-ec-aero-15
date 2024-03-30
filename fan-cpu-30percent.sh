#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"
own_dir="$(dirname $(readlink -f $0))"

# keep fan on the cpu side running at minimum speed but turn off gpu fan
# 68 -> 30%
$own_dir/fan-fixed.sh 68 0
