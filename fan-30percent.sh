#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"
own_dir="$(dirname $(readlink -f $0))"

#68 -> 30%
$own_dir/fan-fixed.sh 68 68
