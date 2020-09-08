#!/usr/bin/env bash

end_color='\033[0m';red='\033[0;31m';
green='\033[0;32m';yellow='\033[1;33m';
function color_echo { echo -e $1$2${end_color}; }

if [ -z "$DOTFILES" ]
then
      color_echo $red "Error: Cant find dotfiles location. Missing \$DOTFILES env var"
      exit 1
else
      echo "Found dotfiles path at: $DOTFILES"
fi

color_echo $green "Install and setup ubuntu apps"
$DOTFILES/ubuntu/install.sh

color_echo $green "Running zsh installer"
$DOTFILES/zsh/install.sh

color_echo $green "Running vim installer"
$DOTFILES/vim/install.sh

color_echo $green "Done."