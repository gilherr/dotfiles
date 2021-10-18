#!/usr/bin/env bash

sudo apt update && sudo apt install -y \
    tldr \
    lnav

# for ubuntu 18.04
wget -P /tmp https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_amd64.deb
sudo dpkg -i /tmp/bat_0.18.3_amd64.deb

wget -P /tmp https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb
sudo dpkg -i /tmp/fd_8.2.1_amd64.deb

# bat:      cat with syntax highlight (fzf dependency)
# fd-find:  file searcher (fzf dependency)

# setup soft links
mkdir -p ~/.local/bin
ln -s $DOTFILES/lnav/formats/installed ~/.lnav/formats/installed
