#!/usr/bin/env bash

if [ -z "$DOTFILES" ]
then
      echo "Error: Cant find dotfiles location. Missing \$DOTFILES env var"
      exit 1
else
      echo "Found dotfiles path at: $DOTFILES"
fi

sudo apt update && apt install -y curl git

$DOTFILES/zsh/install.sh
$DOTFILES/vim/install.sh

echo Done.
