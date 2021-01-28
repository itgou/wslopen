#!/bin/bash
wslPre="\\\\\\\\wsl$\\\\Ubuntu-18.04"
pwd=`readlink -f ./`
if [[ $pwd =~ ^/mnt/c/.* ]]; then
	path=${pwd/\/mnt\/c/c:}
	fpath=${path//\//\\\\}
elif [[ $pwd =~ ^/mnt/d/.* ]]; then
	path=${pwd/\/mnt\/d/d:}
	fpath=${path//\//\\\\}
elif [[ $pwd =~ ^/mnt/e/.* ]]; then
	path=${pwd/\/mnt\/e/e:}
	fpath=${path//\//\\\\}
else
	path=${pwd//\//\\\\}
	fpath=$wslPre$path
fi
cmd="explorer.exe $fpath"
eval $cmd
