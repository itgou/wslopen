#!/bin/bash
pre="\\\\\\\\wsl$\\\\Ubuntu-18.04"
pwd=`pwd`
path=${pwd//\//\\\\}
fpath=$pre$path
echo $fpath
cmd="explorer.exe $fpath"
eval $cmd
