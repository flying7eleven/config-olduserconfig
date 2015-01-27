Userscript & AwesomeWM Configuration
====================================

Install Arch Linux (Base System)
----------------------------
1. Boot from a CD or other install medium
2. partition your disk. If you are using an EFI system, be sure that your first partition is a FAT32 partion with about 200MB space
3. Format the partions
4. Mount the partions as you want them on your system to /mnt
5. Start the installation of the base system
   ```
   pacstrap /mnt base base-devel
   ```

6. Write the mountpoints into the new system
   ```
   genfstab -U -p /mnt >> /mnt/etc/fstab
   ```

7. Go into the new system
   ```
   arch-chroot /mnt /bin/bash
   ```

8. Install some important packages
   ```
   pacman -S vim ctags grub dosfstools efibootmgr sudo git tig zsh xdg-utils
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
    There you should remove the ```quite``` parameter for the default command list (```GRUB_CMDLINE_LINUX_DEFAULT```)

17. Boot loader configuration
  1. Create a EFI module without installing grub onto the harddrive (e.g. for use with MacBooks)
     ```
     grub-mkconfig -o /boot/grub/grub.cfg
     grub-mkstandalone -o /boot/EFI/boot.efi -d /usr/lib/grub/x86_64-efi -O x86_64-efi /boot/grub/grub.cfg
     ```

  2. Install the boot manager
     ```
     grub-mkconfig -o /boot/grub/grub.cfg
     grub-install --target=x86_64-efi --efi-directory=$esp --bootloader-id=grub --recheck --debug
     ```

18. Configure the package manager for installing yaourt by adding the following lines into the ```/etc/pacman.conf``` file:
    ```
    [archlinuxfr]
    SigLevel = Never
    Server = http://repo.archlinux.fr/$arch
    ```

19. Install yaourt:
    ```
    pacman -Sy
    pacman -S yaourt
    ```

20. Add a new user and give him or her sudo privileges:
    ```
    useradd USERNAME
    passwd USERNAME
    cd /home
    mkdir USERNAME
    chown USERNAME:USERNAME -R USERNAME
    chmod o-rwx -R USERNAME
    EDITOR=vim sudoedit /etc/sudoers
    ```

21. Swich to the newly created user:
    ```
    su USERNAME
    ```

22. Prepare the system to support WiFi
    ```
    yaourt -S b43-fwcutter b43-firmware dialog wpa_supplicant --noconfirm
    ```

23. Clone the repository to the right directory
    ```
    mkdir ~/.config
    cd ~/.config
    git clone https://github.com/robbyrussell/oh-my-zsh.git
    git clone https://github.com/thuetz/my-user-configurations.git
    git clone https://github.com/thuetz/awesomeWM.git awesome
    ```

24. Execute the setup script
    ```
    cd $HOME/.config/my-user-configurations
    ./00_setup_user_configs.sh
    ```

25. Log-out and Log-in again to change the shell

26. Exit the newly installed system, unmount the hard drive and reboot into your new system:
    ```
    exit
    exit
    cd /
    umount -R /mnt
    sync
    reboot
    ```


Further configuration after reboot
----------------------------------

1. Run ```01_configure_system.sh``` to install some more required packages and so some basic configuration

2. Setup the graphic card
   Save the configuration file as ```/etc/X11/xorg.conf```. After doing that, change the DPI value to the corresponding value. Therefore, you have to edit the "Device" section and add the following options:
   ```
   Option "UseEdidDpi" "false"
   Option "DPI" "96 x 96"
   ```

3. Reboot your system
