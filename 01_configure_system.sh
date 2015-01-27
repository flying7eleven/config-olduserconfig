#!/bin/bash
# download and install some required packages
yaourt -S xorg-server xorg-server-devel xorg-xinit xorg-utils xf86-input-synaptics awesome nvidia lightdm lightdm-gtk3-greeter pcmanfm numlockx networkmanager network-manager-applet terminator tmux aspell aspell-de aspell-en reflector powertop openntpd htop ttf-dejavu volumeicon conky lm_sensors smartmontools acpid acpi xterm xdg-utils ttf-google-fonts-git powerline-fonts-git ttf-ms-fonts tmuxinator google-chrome lightdm-gtk-greeter-settings pommed-light mbpfan-git gksu --noconfirm --needed

# enable some installed services
sudo systemctl enable lightdm
sudo systemctl enable openntpd
sudo systemctl enable pommed
sudo systemctl enable mbpfan
sudo systemctl enable acpid
sudo systemctl enable NetworkManager

# generate the basic nvidia configuration file for X
sudo nvidia-xconfig

