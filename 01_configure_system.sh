#!/bin/bash
# download and install some required packages
yaourt -S xorg-server xorg-server-devel xorg-utils nvidia lightdm lightdm-gtk-greeter pcmanfm numlockx terminator tmux aspell aspell-de aspell-en reflector powertop openntpd htop ttf-dejavu lm_sensors smartmontools acpid acpi xterm xdg-utils ttf-google-fonts-git powerline-fonts-git ttf-ms-fonts tmuxinator google-chrome lightdm-gtk-greeter-settings gksu ncmpcpp --noconfirm --needed

# enable some installed services
sudo systemctl enable lightdm
sudo systemctl enable openntpd
sudo systemctl enable acpid

# generate the basic nvidia configuration file for X
sudo Xorg -configure

