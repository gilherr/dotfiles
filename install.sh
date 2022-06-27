#!/usr/bin/env bash

source ./shared/color.sh

if [ -z "$DOTFILES" ]
then
      printf "${RED}Error: Cant find dotfiles location. Missing \$DOTFILES env var${NORMAL}"
      exit 1
else
      echo "Found dotfiles path at: $DOTFILES"
fi

printf "${GREEN}Install and setup ubuntu apps\n${NORMAL}"
$DOTFILES/ubuntu/install.sh

printf "${GREEN}Running zsh installer\n${NORMAL}"
$DOTFILES/zsh/install.sh

printf "${GREEN}Running vim installer\n${NORMAL}"
$DOTFILES/vim/install.sh

printf "${GREEN}Done.\n${NORMAL}"
