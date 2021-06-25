#!/usr/bin/env bash

sleep 7s

# set the theme for the first time
lookandfeeltool --resetLayout -a CachyOS

# set font settings
sed -i 's/\[General\]/[General]\
XftAntialias=true\
XftHintStyle=hintfull\
font=Open Sans,10,-1,5,50,0,0,0,0,0\
menuFont=Open Sans,10,-1,5,50,0,0,0,0,0\
smallestReadableFont=Open Sans,8,-1,5,50,0,0,0,0,0\
toolBarFont=Open Sans,10,-1,5,50,0,0,0,0,0/g' ~/.config/kdeglobals

# cleanup
rm ~/.config/autostart/cachyos-theme.desktop

# restart plasma
kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell

# remove this script
rm ~/.local/bin/set-cachy-theme.sh

