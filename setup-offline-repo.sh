#!/usr/bin/env bash 

# offline repo
offline_repo_path="./airootfs/root/offline-repos/"

# packages
arch_packages=" base base-devel linux linux-firmware systemd \
		efibootmgr mkinitcpio vim networkmanager grub libinih libedit"
cachyos_packages=" linux-cacule-headers linux-cacule cachyos-installer"

mkdir -p $offline_repo_path

#
# download arch and cachyos packages
sudo pacman -Syw --cachedir $offline_repo_path \
	--dbpath $offline_repo_path \
	$arch_packages \
	$cachyos_packages

# move .dbs up folder to be alongside with their packages
sudo mv $offline_repo_path/sync/* $offline_repo_path/
