#!/usr/bin/env bash

sudo apt update && sudo apt install -y \
    curl\
    git\
    bat\
    fd-find 

# bat:      cat with syntax highlight (fzf dependency)
# fd-find:  file searcher (fzf dependency)

# setup soft links
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s /usr/bin/fdfind ~/.local/bin/fd
