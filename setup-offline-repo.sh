#!/usr/bin/env bash 

# offline repo
offline_repo_path="./airootfs/root/offline-repos/"

# comment this out if you need to confirm
noconfirm="--noconfirm"

# packages
base_packages="base base-devel linux linux-headers linux-firmware mkinitcpio systemd vim"
arch_packages="efibootmgr mkinitcpio networkmanager grub \
		libinih libedit ntp xfsprogs \
		plasma-desktop plasma-framework plasma-nm plasma-pa \
		konsole kate dolphin sddm sddm-kcm xorg \
		pipewire pipewire-alsa pipewire-jack \
		pipewire-media-session pipewire-pulse \
		gst-plugin-pipewire libpulse"
cachyos_packages="linux-cachyos-headers linux-cachyos cachyos-kde-theme"

mkdir -p $offline_repo_path
# move previous .dbs to sync folder
mv $offline_repo_path/*.db* $offline_repo_path/sync/

#
# download arch and cachyos packages
pacman $noconfirm -Syw --cachedir $offline_repo_path \
	--dbpath $offline_repo_path \
	$base_packages \
	$arch_packages \
	$cachyos_packages

# move .dbs up folder to be alongside with their packages
mv $offline_repo_path/sync/* $offline_repo_path/
