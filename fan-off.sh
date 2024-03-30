#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"
own_dir="$(dirname $(readlink -f $0))"

# keep fans off always (warning, this can make the laptop get really hot and will cause the CPU to throttle heavily!)
$own_dir/fan-fixed.sh 0 0


