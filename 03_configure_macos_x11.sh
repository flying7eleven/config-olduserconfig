#!/bin/sh
Xorg -configure
ln -s $HOME/.config/my-user-configurations/xorg/10-touchpad.conf /etc/X11/xorg.conf.d/10-touchpad.conf
ln -s $HOME/.config/my-user-configurations/xorg/10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
ln -s $HOME/.config/my-user-configurations/xorg/20-nvidia.conf /etc/X11/xorg.conf.d/10-nvidia.conf
