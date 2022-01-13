#!/bin/bash
currentFolder=$(pwd)
buildFolder="${currentFolder}/build"
outFolder="${currentFolder}/out"

echo "################################################################## "
echo "Build folder                           : "$buildFolder
echo "Out folder                             : "$outFolder
echo "################################################################## "

#----------------------------------------------------------------------------------

package="archiso"

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then
  echo "Archiso is already installed"
else
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo "!!!!!!!!!  "$package" has NOT been installed"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  exit 1
fi

echo
echo "Making mkarchiso verbose"
sudo sed -i 's/quiet="y"/quiet="n"/g' /usr/bin/mkarchiso

#----------------------------------------------------------------------------------


echo "Deleting the build folder if one exists - takes some time"
[ -d $buildFolder ] && sudo rm -rf $buildFolder
echo
echo "Copying the Archiso folder to build work"
echo
mkdir $buildFolder
cp -r archiso $buildFolder/archiso

echo
echo "Building the iso - this can take a while - be patient"
echo

[ -d $outFolder ] || mkdir $outFolder
cd $buildFolder/archiso/
sudo mkarchiso -v -w $buildFolder -o $outFolder $buildFolder/archiso/


echo "Moving pkglist.x86_64.txt"
echo "########################"
rename=$(date +%Y-%m-%d)
cp $buildFolder/iso/arch/pkglist.x86_64.txt  $outFolder/cachyos-$rename-pkglist.txt

echo
echo "##################################################################"
tput setaf 2
echo "DONE"
echo "- Check your out folder :"$outFolder
tput sgr0
echo "################################################################## "
echo
