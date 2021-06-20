#!/usr/bin/env bash

sleep 7s

# set the theme for the first time
lookandfeeltool --resetLayout -a CachyOS

# move konsolerc
mv ./konsolerc $HOME/.config/

# move ksplashrc
mv ./ksplashrc $HOME/.config/


# cleanup
rm ~/.config/autostart/cachyos-theme.desktop
rm ~/.local/bin/set-cachy-theme.sh

