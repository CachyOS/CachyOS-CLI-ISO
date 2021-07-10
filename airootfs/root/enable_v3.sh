#!/usr/bin/env bash

/lib/ld-linux-x86-64.so.2 --help | grep "x86-64-v3 (supported, searched)" > /dev/null

if [ $? -eq 0 ]; then
	echo "x86-64-v3 is supported"
	pacman_conf_path="/etc/pacman.conf"

	sed -i 's/Architecture = auto/#Architecture = auto/' $pacman_conf_path
	sed -i 's/#<disabled_v3>//g' $pacman_conf_path

	yes | pacman -Sy

else
	echo "x86-64-v3 is not supported"
fi
