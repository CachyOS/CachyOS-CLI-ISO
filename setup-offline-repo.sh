#!/usr/bin/env bash 

# offline repo
offline_repo_path="./airootfs/root/offline-repos/"

# comment this out if you need to confirm
noconfirm="--noconfirm"

# packages
base_packages="base base-devel linux linux-firmware mkinitcpio systemd vim"
arch_packages="efibootmgr mkinitcpio networkmanager grub \
		libinih libedit ntp xfsprogs \
		plasma-meta kde-applications-meta xorg \
		pipewire pipewire-alsa pipewire-jack \
		pipewire-media-session pipewire-pulse \
		gst-plugin-pipewire libpulse"
cachyos_packages="linux-cachyos-headers linux-cachyos cachyos-kde-theme"

mkdir -p $offline_repo_path

#
# download arch and cachyos packages
sudo pacman $noconfirm -Syw --cachedir $offline_repo_path \
	--dbpath $offline_repo_path \
	$base_packages \
	$arch_packages \
	$cachyos_packages

# move .dbs up folder to be alongside with their packages
sudo mv $offline_repo_path/sync/* $offline_repo_path/
