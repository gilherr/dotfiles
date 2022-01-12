#!/usr/bin/env bash

sudo apt update && sudo apt install -y \
    lnav \
    tree \
    xclip

python3 -m pip install tldr

# for ubuntu 18.04
# go 1.16.9 Xray
# bat:      cat with syntax highlight (fzf dependency)
# fd-find:  file searcher (fzf dependency)

wget -P /tmp https://golang.org/dl/go1.16.9.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/go1.16.9.linux-amd64.tar.gz

wget -P /tmp https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_amd64.deb
sudo dpkg -i /tmp/bat_0.18.3_amd64.deb

wget -P /tmp https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb
sudo dpkg -i /tmp/fd_8.2.1_amd64.deb

# setup soft links
mkdir -p ~/.local/bin
ln -s $DOTFILES/lnav/formats/installed ~/.lnav/formats/installed
