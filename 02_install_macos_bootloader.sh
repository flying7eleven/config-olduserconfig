#!/bin/bash
# infos from http://glandium.org/blog/?p=2830

# install the required packages
yaourt -S libpng libjpeg librsvg libicns mactel-boot hfsprogs --noconfirm --needed

# be sure that everything is processed
read -p "WARNING: Before continueing, ensure that you mounted the HFS+ EFI patition at /boot/efi. Otherwise pre CTRL+C NOW! " RESP
read -p "ARE YOU SURE?" RESP
read -p "LAST CHANCE TO EXIT VIA CTRL+C!" RESP

# prepare the boot partition
sudo mkdir -p /boot/efi/System/Library/CoreServices
sudo sh -c "echo 'This file is required for booting' > /boot/efi/mach_kernel"

# create the boot.efi file
sudo grub-mkstandalone -o /boot/efi/System/Library/CoreServices/boot.efi -d /usr/lib/grub/x86_64-efi -O x86_64-efi /boot/grub/grub.cfg

# convert the icon and copy it to the right place
rsvg-convert -w 128 -h 128 -o /tmp/arch.png archlinux.svg
sudo png2icns /boot/efi/.VolumeIcon.icns /tmp/arch.png

# copy the description file to the boot partition 
sudo cp /usr/share/mactel-boot/SystemVersion.plist /boot/efi/System/Library/CoreServices/

# bless the file to make it bootable
sudo hfs-bless /boot/efi/System/Library/CoreServices/boot.efi
