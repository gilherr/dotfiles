#!/usr/bin/env bash

# Update DOTFILES env var
sed -i "s,export DOTFILES=.*,export DOTFILES=$DOTFILES," $DOTFILES/zsh/zshrc

# install zsh
sudo apt install -y zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# set zsh as login shell
chsh -s $(which zsh)

# install oh-my-zsh plugins
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# insall fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all


# add custom zshrc to home
[ -f "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ] && rm "$HOME/.zshrc"
ln -s $DOTFILES/zsh/zshrc $HOME/.zshrc
