#!/bin/bash
mkdir -p $HOME/.local/share/applications

# create the symbolic links to the provided configuration files
ln -s $HOME/.config/my-user-configurations/shell/zshrc $HOME/.zshrc
ln -s $HOME/.config/my-user-configurations/shell/zsh_profile $HOME/.zsh_profile
ln -s $HOME/.config/my-user-configurations/uncrustify.config $HOME/.uncrustify.config

# change the default shell for this user to the ZSH
chsh -s /bin/zsh

# set some default mime handlers
xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https
xdg-mime default pcmanfm.desktop inode/directory
xdg-mime default pcmanfm.desktop inode/directory
