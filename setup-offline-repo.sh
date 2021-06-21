#!/usr/bin/env bash 

# arch offline repo
arch_offline_repo_path="./airootfs/root/offline-repos/arch-repo/"
arch_packages=" base base-devel linux linux-firmware systemd efibootmgr mkinitcpio vim"

# cachyos offline repo
cachyos_local_git_repo_patch="/home/hamad/dev/cachyos/cachyos_repo"
cachyos_offline_repo_path="./airootfs/root/offline-repos/cachyos-repo/"

mkdir -p $arch_offline_repo_path
mkdir -p $cachyos_offline_repo_path

#
# copy cachyos db and packages files
cd $cachyos_local_git_repo_patch
echo "**** git pull cachyos repo last update ****"
git pull origin master

# cd back to this dir
cd -
echo "**** copy cachyos repo files ****"
rsync -av --progress $cachyos_local_git_repo_patch/* $cachyos_offline_repo_path \
	--exclude .git

#
# download arch packages
sudo pacman -Syw --cachedir $arch_offline_repo_path \
	--dbpath $arch_offline_repo_path \
	$arch_packages

