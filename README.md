Userscript & AwesomeWM Configuration
====================================

Install Arch Linux
------------------
1. Boot from a CD or other install medium
2. partition your disk. If you are using an EFI system, be sure that your first partition is a FAT32 partion with about 200MB space
3. Format the partions
4. Mount the partions as you want them on your system to /mnt
5. Start the installation of the base system
   ```
   pacstrap /mnt base
   ```

6. Write the mountpoints into the new system
   ```
   genfstab -p /mnt >> /mnt/etc/fstab
   ```

7. Go into the new system
   ```
   arch-chroot /mnt
   ```

8. Install some important packages
   ```
   pacman -S vim grub dosfstools efibootmgr
   ```

9. Set the correct hostname
   ```
   echo "hostname" > /etc/hostname
   ```

10. Set the correct timezone
    ```
    ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
    ```

11. Uncomment the selected locale in /etc/locale.gen and generate it with locale-gen.
12. Set locale preferences in /etc/locale.conf
    ```
    locale > /etc/locale.conf
    ```

13. Add console keymap and font preferences in /etc/vconsole.conf
    ```
    echo "KEYMAP=en" > /etc/vconsole.conf
    ```

14. Configure /etc/mkinitcpio.conf as needed and create an initial RAM disk with:
    ```
    mkinitcpio -p linux
    ```

15. Set a root password with passwd.
16. Configure the default parameters for grub
    ```
    vim /etc/default/grub
    ```

    If you are using an iMac you may add "reboot=pci" to your "GRZB_CMDLINE_LINUX".

17. Install the boot manager
    ```
    grub-install --target=x86_64-efi --efi-directory=$esp --bootloader-id=grub --recheck --debug
    grub-mkconfig -o /boot/grub/grub.cfg
    ```

18. Exit the newly installed system, unmount the hard drive and reboot into your new system:
    ```
    exit
    cd /
    umount -R /mnt
    sync
    reboot
    ```


Usage (on ArchLinux)
--------------------
1. Add the following line to your ```/etc/pacman.conf``` file:
   ```
   [archlinuxfr]
   SigLevel = Never
   Server = http://repo.archlinux.fr/$arch
   ```

2. Install awesomewm and some other required applications
   ```
   sudo pacman -Sy
   sudo pacman -S xf86-video-nouveau xorg-server xorg-xinit awesome pcmanfm yaourt numlockx networkmanager network-manager-applet tmux aspell aspell-de aspell-en base-devel reflector
   ```

3. Install some required fonts and some other required tools from AUR:
   ```
   yaourt -S ttf-google-fonts-git powerline-fonts-git tmuxinator --noconfirm
   ```

4. Clone the repository to the right directory
   ```
   cd ~/.config
   git clone git@github.com:robbyrussell/oh-my-zsh.git
   git clone git@github.com:thuetz/my-user-configurations.git
   ```

5. Install the provided user scripts (for zsh):
   ```
   mkdir -p $HOME/.config/systemd/user
   mkdir -p $HOME/.config/terminator
   ln -s $HOME/.config/my-user-configurations/shell/zshrc $HOME/.zshrc
   ln -s $HOME/.config/my-user-configurations/shell/zsh_profile $HOME/.zsh_profile
   ln -s $HOME/.config/my-user-configurations/terminator $HOME/.config/terminator/config
   ln -s $HOME/.config/my-user-configurations/vimrc $HOME/.vimrc
   ln -s $HOME/.config/my-user-configurations/xinitrc $HOME/.xinitrc
   ln -s $HOME/.config/my-user-configurations/taskrc $HOME/.taskrc
   ln -s $HOME/.config/my-user-configurations/tmuxinator $HOME/.tmuxinator
   ln -s $HOME/.config/my-user-configurations/tmux $HOME/.tmux.conf
   ln -s $HOME/.config/my-user-configurations/mailcap $HOME/.mailcap
   ln -s $HOME/.config/my-user-configurations/uncrustify.config $HOME/.uncrustify.config
   ```

6. Change the default shell to zsh
   ```
   chsh -s /bin/zsh
   ```
   Restart the terminal aftering issuing the command above!

7. Configure the default applications
   Set some of the default applications of your computer
   ```
   xdg-mime default google-chrome.desktop x-scheme-handler/http
   xdg-mime default google-chrome.desktop x-scheme-handler/https
   xdg-mime default pcmanfm.desktop inode/directory
   xdg-mime default pcmanfm.desktop inode/directory
   xdg-mime default thunderbird.desktop x-scheme-handler/mailto
   xdg-mime default thunderbird.desktop message/rfc822 
   ```

8. Ensure that the correct git configuration is used
   ```
   git config --global include.path $HOME/.config/my-user-configurations/gitconfig
   git config --global user.name "Your Name"
   git config --global user.email your@address.com
   ```

9. Configure the network-manager to get the correct DHCP address. The first step is to tell the network-manager which DHCP implementation should be used:
   ```
   sudo sh -c "echo 'dhcp=dhcpcd' >> /etc/NetworkManager/NetworkManager.conf"
   ```
   After this was done, get your MAC address by entering the following command:
   ```
   ip link show
   ```
   Then replace the interface name and your MAC address in the following lines and execute them to write the information into your ```/etc/dhclient.conf``` file:
   ```
   sudo sh -c "echo 'interface \"eth0\" {' >> /etc/dhclient.conf"
   sudo sh -c "echo '    send dhcp-client-identifier 01:aa:bb:cc:dd:ee:ff;' {' >> /etc/dhclient.conf"
   sudo sh -c "echo '}' >> /etc/dhclient.conf"
   ```

10. Disable the manually started DHCP client and enable and start the network-manager:
   ```
   sudo systemctl stop dhcpcd
   sudo systemctl disable dhcpcd
   sudo systemctl enable NetworkManager
   sudo systemctl start NetworkManager
   ```

11. Start awesomewm
