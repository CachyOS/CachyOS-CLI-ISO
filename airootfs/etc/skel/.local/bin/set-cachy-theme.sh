#!/usr/bin/env bash

sleep 7s

# set the theme for the first time
lookandfeeltool -a com.github.rkstrdee.emerald

# cleanup
rm ~/.config/autostart/cachyos-theme.desktop

# restart plasma
kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell

# remove this script
rm -R ~/.local/bin/

