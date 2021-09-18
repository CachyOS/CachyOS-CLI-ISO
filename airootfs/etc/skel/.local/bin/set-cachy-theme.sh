#!/usr/bin/env bash

wget https://mirror.cachyos.org/cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz
cd repo
msg "enter your password for enabling the optimized repos"
sudo ./cachyos-repo.sh

sleep 10s

# set the theme for the first time
lookandfeeltool -a com.github.rkstrdee.emerald

# cleanup
rm ~/.config/autostart/cachyos-theme.desktop

# restart plasma
kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell

# remove this script
rm -R ~/.local/bin/
