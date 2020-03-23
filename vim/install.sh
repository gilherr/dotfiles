# Install vim
sudo -k apt install -y vim || true

# Download vim-plug & creare appropriate folders
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Append or create ~/.vimrc file sourcing vimrc_custom
echo 'source $DOTFILES/vim/vimrc_custom' >> ~/.vimrc

# Open vim, run :PlugInstall and quit
vim +PlugInstall +qall

echo done.
