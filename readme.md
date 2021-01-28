quickly open current directory with windows explorer in wsl shell

all script
```shell
#!/bin/bash
wslPre="\\\\\\\\wsl$\\\\Ubuntu-18.04"  # you need modify to yours
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
```

```
mv open.sh /usr/bin/open
chmod +x /usr/bin/open
```

then can user command open in wsl linux shell

#NOTE1: if your linux is not ubuntu or the path is not "wsl$/Ubuntu-18.04", you need modify the script virable "wslPre in the 2nd line", you can input "\\wsl$" in your windows file explorer to check what the wsl path is yours

#NOTE1: if you have f,e disk, you need add more elif condition in the script.
