#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"
own_dir="$(dirname $(readlink -f $0))"

#114 -> 50%
$own_dir/fan-fixed.sh 114 114
