#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"
own_dir="$(dirname $(readlink -f $0))"

# keep fan on the cpu side running at 40% but turn off gpu fan
# 91 -> 40%
$own_dir/fan-fixed.sh 91 0
