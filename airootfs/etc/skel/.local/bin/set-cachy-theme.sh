#!/usr/bin/env bash

sleep 7s

# set the theme for the first time
lookandfeeltool --resetLayout -a CachyOS

# move konsolerc
mv ./konsolerc ~/.config/

# move ksplashrc
mv ./ksplashrc ~/.config/

# cleanup
rm ~/.config/autostart/cachyos-theme.desktop

# restart plasma
kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell

# remove this script
rm ~/.local/bin/set-cachy-theme.sh

