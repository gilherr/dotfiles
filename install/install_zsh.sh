#!/usr/bin/bash

# install zsh
sudo -k pacman -S zsh

# set zsh as login shell
chsh -s $(which zsh)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
