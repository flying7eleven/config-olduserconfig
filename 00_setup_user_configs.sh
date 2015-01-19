#!/bin/bash
mkdir -p $HOME/.config/systemd/user
mkdir -p $HOME/.config/terminator
mkdir -p $HOME/.cache/awesome

# create the symbolic links to the provided configuration files
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

# change the default shell for this user to the ZSH
chsh -s /bin/zsh

# set some default mime handlers
xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https
xdg-mime default pcmanfm.desktop inode/directory
xdg-mime default pcmanfm.desktop inode/directory
#xdg-mime default thunderbird.desktop x-scheme-handler/mailto
#xdg-mime default thunderbird.desktop message/rfc822 
