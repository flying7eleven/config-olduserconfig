#!/bin/bash
mirrorlistFile="/etc/pacman.d/mirrorlist"
pacnewMirrorlist="/etc/pacman.d/mirrorlist.pacnew"
tmpMirrorlist="/tmp/mirrorlist.tmp"
tmpMirrorlistRated="/tmp/mirrorlist.rated.tmp"

# if there is new pacnew file, do not execute this script
if [ ! -e "$pacnewMirrorlist" ]
then
	echo "The file $pacnewMirrorlist does not exists. There is no need of re-rating the servers!"
	exit -1
fi

# copy the pacnew file and enable all German servers
echo "-> Enabling all German mirror servers..."
cp $pacnewMirrorlist $tmpMirrorlist
sed -i '/Germany/,/^\s*$/s/^#Server/Server/' $tmpMirrorlist

# rate the top 20 of the servers by speed
echo "-> Rating the top 20 mirror servers by speed..."
rankmirrors -n 20 $tmpMirrorlist > $tmpMirrorlistRated

# try to get root rights
sudo -p "-> Please enter your sudo password for copying the new file to the correct directory: " echo ""

# if we could not get root rights, terminate
if [ $? -ne 0 ];
then
	echo "Failed to get root rights. The $mirrorlistFile file was *NOT* re-written. Terminating!."
	exit -2
fi

# copy the new rated mirror file and delete the pacnew file
echo "-> Copying the rated mirror list to $mirrorlistFile"
sudo cp $tmpMirrorlistRated $mirrorlistFile

# delete the pacnew file of the mirror list
echo "-> Deleting the old $pacnewMirrorlist file"
sudo rm $pacnewMirrorlist
