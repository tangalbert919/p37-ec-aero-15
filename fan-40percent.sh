#!/bin/bash
inst_dir="$(dirname $(readlink -f $0))/bin"
own_dir="$(dirname $(readlink -f $0))"

#91 -> 40%
$own_dir/fan-fixed.sh 91 91
